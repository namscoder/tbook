<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Promotion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    //
    public function index()
    {
        $carts = DB::table('carts')
            ->join('books', 'books.id', '=', 'carts.book_id')
            ->whereNull('carts.deleted_at')
            ->where('carts.user_id', Auth::user()->id)
            ->select('carts.*', 'books.book_title', 'books.price', 'books.promotion_price', 'books.image')
            ->get();
        return view("clients.cart", compact("carts"));
    }

    public function add_to_cart(Request $request, $id)
    {
        $book = DB::table('books')->where('id', $id)->first();
        $cart = DB::table('carts')
            ->where('user_id', Auth::user()->id)
            ->where('book_id', $id)
            ->first();

        if ($cart) {
            if (isset($request->quantity)) {
                $carts = DB::table('carts')->where('id', '=', $cart->id)->update(['quantity' => $cart->quantity + $request->quantity]);
            } else {
                $carts = DB::table('carts')->where('id', '=', $cart->id)->update(['quantity' => $cart->quantity + 1]);
            }
        } else {
            if (isset($request->quantity)) {
                $data = [
                    'book_id' => $id,
                    'quantity' => $request->quantity,
                    'price' => $book->promotion_price ? $book->promotion_price : $book->price,
                    'user_id' => Auth::user()->id
                ];
            } else {
                $data = [
                    'book_id' => $id,
                    'quantity' => 1,
                    'price' => $book->promotion_price ? $book->promotion_price : $book->price,
                    'user_id' => Auth::user()->id
                ];
            }

            $carts = Cart::create($data);
        }
        if ($carts) {
            return redirect()->back();
        }
    }

    public function update_quantity(Request $request, $id)
    {
    }

    public function descrease_quantity(Request $request, $id)
    {
        $cart = DB::table('carts')
            ->where('user_id', Auth::user()->id)
            ->where('book_id', $id)
            ->first();
        $ud = DB::table('carts')
            ->where('user_id', Auth::user()->id)
            ->where('book_id', $id)
            ->update(['quantity' => $cart->quantity - 1]);
        if ($ud) {
            Session::flash('success', 'Cập nhật số lượng thành công');
        }
        return redirect()->route("cart");
    }
    public function increase_quantity(Request $request, $id)
    {
        $cart = DB::table('carts')
            ->where('user_id', Auth::user()->id)
            ->where('book_id', $id)
            ->first();
        $ud = DB::table('carts')
            ->where('user_id', Auth::user()->id)
            ->where('book_id', $id)
            ->update(['quantity' => $cart->quantity + 1]);
        if ($ud) {
            Session::flash('success', 'Cập nhật số lượng thành công');
        }
        return redirect()->route("cart");
    }

    public function delete_book_cart(Request $request, $id)
    {
        $cart = Cart::where('user_id', Auth::user()->id)
            ->where('book_id', $id)
            ->delete();
        if ($cart) {
            Session::flash('success_dl', 'Xóa sản phẩm khỏi giỏ hàng thành công');
        }
        return redirect()->route("cart");
    }

    public function payment_page(Request $request)
    {
        $button = $request->input('submitButton');
        // Xử lý theo giá trị của nút bấm
        switch ($button) {
            case 'payment':
                $books = [];
                $total_money = 0;
                foreach ($request->book_ids as $key => $value) {
                    $book = DB::table('carts')
                        ->join('books', 'books.id', '=', 'carts.book_id')
                        ->where('user_id', Auth::user()->id)
                        ->where('book_id', $key)
                        ->select('carts.*', 'books.book_title', 'books.price', 'books.promotion_price', 'books.image')
                        ->first();
                    $books[] = $book;
                    $total_money += $book->quantity * ($book->promotion_price ? $book->promotion_price : $book->price);
                }
                $user = Auth::user();

                $promotions_used = Order::where('user_id', Auth::user()->id)->where('discount_code', '!=', '')->get();
                $promotions_use = [];
                foreach ($promotions_used as $promotion) {
                    $promotions_use[] = $promotion->discount_code;
                }
                $promotions = DB::table('promotions')->whereNotIn('discount_code', $promotions_use)->get();

                return view('clients.payment_page', compact(['books', 'user', 'total_money', 'promotions']));
                break;
            case 'delete':
                // Hiển thị dữ liệu ra màn hình
                foreach ($request->book_ids as $key => $value) {
                    $book_dl = Cart::join('books', 'books.id', '=', 'carts.book_id')
                        ->where('user_id', Auth::user()->id)
                        ->where('book_id', $key)
                        ->delete();
                }
                return redirect()->back();
                break;
        }
    }
}
