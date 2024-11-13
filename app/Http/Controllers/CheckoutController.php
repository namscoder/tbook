<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Order_Detail;
use App\Models\Promotion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CheckoutController extends Controller
{
    //
    public function checkout(Request $request)
    {
        if ($request->isMethod("POST")) {
            $recipient_name = $request->recipient_name;
            $recipient_phone_number = $request->recipient_phone_number;
            $delivery_address = $request->delivery_address;


            $errors_m = [];
            // validate thông tin người nhận
            if ($recipient_name . trim('') == "") {
                $errors_m["recipient_name"] = "Tên người nhận không được để trống";
            }
            if ($recipient_phone_number . trim('') == "") {
                $errors_m["recipient_phone_number"] = "Số điện thoại người nhận không được để trống";
            } elseif (!preg_match('/^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/', $recipient_phone_number)) {
                $errors_m["recipient_phone_number"] = "Số điện thoại không đúng định dạng";
            }
            if ($delivery_address . trim('') == "") {
                $errors_m["delivery_address"] = "Địa chỉ người nhận không được để trống";
            }
            // sách
            $books = [];
            $ship = $request->ship;
            $total_money = 0;
            $book_ids = json_decode(json_encode($request->book_ids), true);
            foreach ($book_ids as $key => $value) {
                $book = DB::table('carts')
                    ->join('books', 'books.id', '=', 'carts.book_id')
                    ->where('user_id', Auth::user()->id)
                    ->where('book_id', $key)
                    ->select('carts.*', 'books.book_title', 'books.price', 'books.promotion_price', 'books.image')
                    ->first();
                $books[] = $book;

                $total_money += $book->quantity * ($book->promotion_price ? $book->promotion_price : $book->price);
            }
            $discount_id = $request->discount_code;
            if ($discount_id != 0) {
                $discount_code = DB::table('promotions')->where('id', $discount_id)->first();
                $total_money = $total_money * (100 - $discount_code->discount_percent) / 100;
                $code = $discount_code->discount_code;
            } else {
                $code = '';
            }
            $user = Auth::user();
            if ($errors_m) {
                return view('clients.payment_page', compact(['books', 'user', 'total_money', 'errors_m']));
            } else {
                $order = [
                    'user_id' => $user->id,
                    'discount_code' => $code,
                    'total_money' => $total_money,
                    'transport_fee' => $ship,
                    'status' => 0,
                    'delivery' => 0,
                    'recipient_name' => $recipient_name,
                    'recipient_phone_number' => $recipient_phone_number,
                    'delivery_address' => $delivery_address,
                ];
                $orders = Order::create($order);
                if ($orders->id) {
                    foreach ($books as $book) {
                        $order_detail = [
                            'order_id' => $orders->id,
                            'book_id' => $book->book_id,
                            'quantity' => $book->quantity,
                            'price' => $book->price,
                        ];
                        Order_Detail::create($order_detail);
                    }
                }
                switch ($request->payment_method) {
                    case "vnpay":
                        //cập nhật phương thức thanh toán
                        Order::where('id', $orders->id)->update(['payment_method' => 1]);
                        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
                        $vnp_Returnurl = "http://127.0.0.1:8000/payment_check";
                        $vnp_TmnCode = "TZ9VESFF"; //Mã website tại VNPAY 
                        $vnp_HashSecret = "WLOBQXHCIIPTXSYWCKHEQWGRIGLSPOXS"; //Chuỗi bí mật

                        $vnp_TxnRef = $orders->id; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
                        $vnp_OrderInfo = 'Thông tin đơn hàng';
                        $vnp_OrderType = 'billpayment';
                        $vnp_Amount = ($total_money + $ship) * 100;
                        $vnp_Locale = 'vn';
                        $vnp_BankCode = 'NCB';
                        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

                        $inputData = array(
                            "vnp_Version" => "2.1.0",
                            "vnp_TmnCode" => $vnp_TmnCode,
                            "vnp_Amount" => $vnp_Amount,
                            "vnp_Command" => "pay",
                            "vnp_CreateDate" => date('YmdHis'),
                            "vnp_CurrCode" => "VND",
                            "vnp_IpAddr" => $vnp_IpAddr,
                            "vnp_Locale" => $vnp_Locale,
                            "vnp_OrderInfo" => $vnp_OrderInfo,
                            "vnp_OrderType" => $vnp_OrderType,
                            "vnp_ReturnUrl" => $vnp_Returnurl,
                            "vnp_TxnRef" => $vnp_TxnRef,
                        );

                        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                            $inputData['vnp_BankCode'] = $vnp_BankCode;
                        }
                        if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
                            $inputData['vnp_Bill_State'] = $vnp_Bill_State;
                        }

                        //var_dump($inputData);
                        ksort($inputData);
                        $query = "";
                        $i = 0;
                        $hashdata = "";
                        foreach ($inputData as $key => $value) {
                            if ($i == 1) {
                                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                            } else {
                                $hashdata .= urlencode($key) . "=" . urlencode($value);
                                $i = 1;
                            }
                            $query .= urlencode($key) . "=" . urlencode($value) . '&';
                        }

                        $vnp_Url = $vnp_Url . "?" . $query;
                        if (isset($vnp_HashSecret)) {
                            $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret); //  
                            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
                        }
                        $returnData = array(
                            'code' => '00', 'message' => 'success', 'data' => $vnp_Url
                        );
                        if (isset($_POST['redirect'])) {
                            header('Location: ' . $vnp_Url);
                            die();
                        } else {
                            echo json_encode($returnData);
                        }
                        // vui lòng tham khảo thêm tại code demo
                        break;

                        //thanh toán khi nhận hàng
                    case 'khinhanhang':
                        //cập nhật phương thức thanh toán
                        Order::where('id', $orders->id)->update(['payment_method' => 0]);
                        $message = "Đặt Hàng Thành Công";
                        $book_ids = DB::table('orders')
                            ->join('order_details', 'order_details.order_id', '=', 'orders.id')
                            ->where('order_details.order_id', $orders->id)
                            ->select('order_details.book_id', 'order_details.quantity')
                            ->get();
                        foreach ($book_ids as $book) {
                            $cart = DB::table('carts')
                                ->where('user_id', Auth::user()->id)
                                ->where('book_id', $book->book_id)
                                ->delete();
                            $b = Book::find($book->book_id);
                            Book::where('id', $book->book_id)->update(['sold' => $b->sold + $book->quantity]);
                            Book::where('id', $book->book_id)->update(['quantity' => $b->quantity - $book->quantity]);
                        }
                        return view('clients.payment_check', compact('message', 'orders'));
                        break;
                }
            }
        }
    }

    public function payment_check(Request $request)
    {
        /* Payment Notify
        * IPN URL: Ghi nhận kết quả thanh toán từ VNPAY
        * Các bước thực hiện:
        * Kiểm tra checksum 
        * Tìm giao dịch trong database
        * Kiểm tra số tiền giữa hai hệ thống
        * Kiểm tra tình trạng của giao dịch trước khi cập nhật
        * Cập nhật kết quả vào Database
        * Trả kết quả ghi nhận lại cho VNPAY
        */
        // require_once("./config.php");
        $inputData = array();
        $returnData = array();
        $vnp_HashSecret = "WLOBQXHCIIPTXSYWCKHEQWGRIGLSPOXS";
        foreach ($_GET as $key => $value) {
            if (substr($key, 0, 4) == "vnp_") {
                $inputData[$key] = $value;
            }
        }

        $vnp_SecureHash = $inputData['vnp_SecureHash'];
        unset($inputData['vnp_SecureHash']);
        ksort($inputData);
        $i = 0;
        $hashData = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashData = $hashData . '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashData = $hashData . urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
        }

        $secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);
        $vnpTranId = $inputData['vnp_TransactionNo']; //Mã giao dịch tại VNPAY
        $vnp_BankCode = $inputData['vnp_BankCode']; //Ngân hàng thanh toán
        $vnp_Amount = $inputData['vnp_Amount'] / 100; // Số tiền thanh toán VNPAY phản hồi

        $Status = 0; // Là trạng thái thanh toán của giao dịch chưa có IPN lưu tại hệ thống của merchant chiều khởi tạo URL thanh toán.
        $orderId = $inputData['vnp_TxnRef'];
        try {
            //Check Orderid    
            //Kiểm tra checksum của dữ liệu
            if ($secureHash == $vnp_SecureHash) {
                //Lấy thông tin đơn hàng lưu trong Database và kiểm tra trạng thái của đơn hàng, mã đơn hàng là: $orderId            
                //Việc kiểm tra trạng thái của đơn hàng giúp hệ thống không xử lý trùng lặp, xử lý nhiều lần một giao dịch
                //Giả sử: $order = mysqli_fetch_assoc($result);   
                $order = Order::find($orderId);

                if ($order != NULL) {
                    if ($order["total_money"] + $order["transport_fee"] == $vnp_Amount) //Kiểm tra số tiền thanh toán của giao dịch: giả sử số tiền kiểm tra là đúng. //$order["Amount"] == $vnp_Amount
                    {
                        if ($order["status"] == 0) {
                            if ($inputData['vnp_ResponseCode'] == '00' || $inputData['vnp_TransactionStatus'] == '00') {
                                $Status = 1; // Trạng thái thanh toán thành công
                                $returnData['RspCode'] = '00';
                                $returnData['Message'] = 'Thanh toán thành công';
                                $book_ids = DB::table('orders')
                                    ->join('order_details', 'order_details.order_id', '=', 'orders.id')
                                    ->where('order_details.order_id', $orderId)
                                    ->select('order_details.book_id', 'order_details.quantity')
                                    ->get();
                                foreach ($book_ids as $book) {
                                    $cart = DB::table('carts')
                                        ->where('user_id', Auth::user()->id)
                                        ->where('book_id', $book->book_id)
                                        ->delete();
                                    $b = Book::find($book->book_id);
                                    Book::where('id', $book->book_id)->update(['sold' => $b->sold + $book->quantity]);
                                    Book::where('id', $book->book_id)->update(['quantity' => $b->quantity - $book->quantity]);
                                }
                            } else {
                                $Status = 2; // Trạng thái thanh toán thất bại / lỗi
                                $returnData['RspCode'] = '99';
                                $returnData['Message'] = 'Thanh toán thất bại / lỗi';
                                //nếu trạng thái thanh toán thất bại hoặc hủy hoặc lỗi thì chuyển trạng thái giao hàng của đơn hàng về hủy đơn
                                Order::where('id', $orderId)->update(['delivery' => 4]);
                            }
                            //Cài đặt Code cập nhật kết quả thanh toán, tình trạng đơn hàng vào DB
                            Order::where('id', $orderId)->update(['status' => $Status]);
                            //Trả kết quả về cho VNPAY: Website/APP TMĐT ghi nhận yêu cầu thành công                

                        } elseif ($order["status"] == 1) {
                            $returnData['RspCode'] = '02';
                            $returnData['Message'] = 'Đơn hàng đã được xác thực';
                        } else {
                            // Trạng thái thanh toán thất bại / lỗi
                            Order::where('id', $orderId)->update(['status' => 2]);
                            $returnData['RspCode'] = '99';
                            $returnData['Message'] = 'Thanh toán thất bại / lỗi';
                        }
                    } else {
                        Order::where('id', $orderId)->update(['status' => 2]);
                        $returnData['RspCode'] = '04';
                        $returnData['Message'] = 'Số tiền không hợp lệ';
                    }
                } else {
                    $returnData['RspCode'] = '01';
                    $returnData['Message'] = 'Không tìm thấy đơn hàng';
                }
            } else {
                $returnData['RspCode'] = '97';
                $returnData['Message'] = 'Chữ ký không hợp lệ';
            }
        } catch (Exception $e) {
            $returnData['RspCode'] = '99';
            $returnData['Message'] = 'Unknow error';
        }


        //Trả lại VNPAY theo định dạng JSON
        return view('clients.payment_check', compact(['returnData', 'orderId']));
    }
}
