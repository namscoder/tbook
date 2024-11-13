<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Required meta tags-->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Thanh Toán</title>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="{{ asset('/css/payment.css') }}">
    </head>
    <body>
        <div class="container">
            <form action="{{ route('checkout') }}" method="POST" enctype="multipart/form-data">
                @csrf             
                <div class="customer_information">
                    <h3>Thông tin khách hàng</h3>
                    <div class="row">
                        <div class="col-lg-6 col-sm-12">
                            <label for="" class="form-label">Người Nhận</label>
                            <input type="text" name="recipient_name" class="form-control" value="{{ $user->name }}">
                            <span  style="color: red" >{{ $errors_m['recipient_name'] ?? "" }}</span>
                        </div>
                        <div class="col-lg-6 col-sm-12">
                            <label for="" class="form-label">Số điện thoại</label>
                            <input type="text" name="recipient_phone_number" class="form-control" value="{{ $user->phone_number }}">
                            <span  style="color: red" >{{ $errors_m['recipient_phone_number'] ?? "" }}</span>
                        </div>
                        <div class="col-lg-12 col-sm-12">
                            <label for="" class="form-label">Địa chỉ nhận hàng</label>
                            <input type="text" name="delivery_address" class="form-control" value="{{ $user->address }}">
                            <span  style="color: red" >{{ $errors_m['delivery_address'] ?? "" }}</span>
                        </div>
                    </div>
                </div>

                <div class="product">
                    <h3>Sản phẩm</h3>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Sách</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($books as $book)
                            <input type="hidden" name="book_ids[{{ $book->book_id }}]" value="{{ $book->quantity * $book->price }}">
                                <tr>
                                    <td>{{ $book->book_title }}</td>
                                    <td>{{ $book->quantity }}</td>
                                    <td>{{number_format($book->promotion_price ? $book->promotion_price : $book->price, 0, '', ',')}} đ</td>
                                    <td>
                                        {{number_format($book->quantity * ($book->promotion_price ? $book->promotion_price : $book->price), 0, '', ',')}} đ
                                    </td>
                                </tr>   
                            @endforeach
                            <tr>
                                <td colspan="3"><strong>Tổng Tiền</strong></td>
                                <td id="total_money">{{ number_format($total_money, 0 , '', ',') }} đ</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="voucher">
                    <h3>Voucher</h3>
                    <div class="row">
                        <div class="col-lg-6">
                            <select style="color: black" class="form-select form-control" name="discount_code" aria-label="Default select example">
                                <option value="0" selected>Voucher giảm giá</option>
                                @foreach ($promotions as $promotion)
                                    @php
                                        date_default_timezone_set('Asia/Ho_Chi_Minh');
                                        // Lấy ngày hôm nay
                                        $today = date('Y-m-d');
                                        // So sánh ngày hôm nay với ngày bắt đầu và kết thúc của promotion
                                        $start = strtotime($promotion->start);
                                        $end = strtotime($promotion->end);
                                        $current = strtotime($today);
                                        // Nếu ngày hôm nay nằm trong khoảng thì không disabled, nếu nằm ngoài thì disabled
                                        $disabled = ($current >= $start && $current <= $end) ? '' : 'disabled';
                                    @endphp
                                    <option value="{{ $promotion->id }}" {{ $disabled }}>
                                        Giảm <span id="discount_percent">{{ $promotion->discount_percent }}</span>% ({{ $promotion->event }})
                                        <p style="color:gray; font-size: 13px;">Áp dụng: {{ $promotion->start }} đến ngày {{ $promotion->end }}</p>
                                    </option>
                                @endforeach
                            </select>
                        </div>
                       
                    </div>
                </div>

                <div class="payment_method">
                    <div class="header_payment_method row">
                        <h3>Phương thức thanh toán</h3>
                        <div class="payment_method_item">
                            <input type="radio" class="btn-check" name="payment_method" id="btn-check-vnpay" hidden autocomplete="off" value="vnpay">
                            <label for="btn-check-vnpay">VNPAY</label>
                        {{-- 
                            <input type="radio" class="btn-check" name="payment_method" id="btn-check-momo" hidden  autocomplete="off" value="momo">
                            <label for="btn-check-momo">Momo</label>

                            <input type="radio" class="btn-check" name="payment_method" id="btn-check-bank" hidden  autocomplete="off" value="nganhang">
                            <label for="btn-check-bank">Chuyển khoản ngân hàng</label> --}}

                            <input type="radio" class="btn-check" name="payment_method" id="btn-check-nhanhang" hidden autocomplete="off" value="khinhanhang">
                            <label for="btn-check-nhanhang">Thanh toán khi nhận hàng</label>
                        </div>
                    </div>

                    <div class="total_payment">
                        <div class="left">
                            <h3>Tổng tiền hàng</h3>
                            <span id="total_money_1"></span>
                        </div>
                        <div class="left">
                            <h3>Phí vận chuyển</h3>
                            <span id="ship">30.000 đ</span>
                            <input type="hidden" name="ship" value="30000">
                        </div>
                        <div class="left">
                            <h3>Tổng thanh toán</h3>
                            <span style="color:red;font-size:30px;" id="total_all"></span>
                        </div>
                        <hr>
                        <div class="btn-payment">
                            <span>Đặt hàng đồng nghĩa với việc đồng ý tuân theo <a href="{{ route('term_of_use') }}">Điều khoản của chúng tôi.</a></span>
                            <button class="btn btn-danger" name="redirect" id="btn-check" disabled >
                                Đặt hàng
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--Optional JavaScript-->
        <!--jQuery first, then Popper.js, then Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script>
            var btns=document.querySelectorAll(".btn-check");
            for(var i=0; i<btns.length; i++){
                btns[i].addEventListener("click",function(){
                    document.getElementById("btn-check").disabled = false;
                })            
            }
        
            var select = document.querySelector ("select[name='discount_code']"); 
            // Lấy phần tử span bằng id total_money 
            var total_money = document.getElementById ("total_money");
            // Lấy phần tử span bằng id total_money_1
            var total_money_1 = document.getElementById ("total_money_1");
            var ship = document.getElementById ("ship");
            var total_all = document.getElementById ("total_all");
            //lấy giá trị của total_money_1
            var t1  = total_money.textContent.replace (",",'');
                t1 = Number(t1.replace ("đ",''));
            var ship1 = ship.textContent.replace (".",'');
                ship1 = Number(ship1.replace ("đ",''));
            //tổng tiền và tổng đơn
                total_money_1.textContent = total_money.textContent;
                total_all.textContent = (t1 + ship1).toFixed (0).replace (/\B(?=(\d{3})+(?!\d))/g, ",") + " đ";;
            // Thêm sự kiện onchange cho select
            select.addEventListener ("change", function () {
                // Lấy giá trị của select
                var value = this.value;
                var promotions = @json($promotions);
                var total = total_money.textContent.replace (",",'');
                    total = Number(total.replace ("đ",''));
                // Nếu value bằng 0, tức là không áp dụng mã giảm giá
                if (value == 0) {
                    // Gán giá trị của total_money cho total_money_1 và total_all
                    total_money_1.textContent = total_money.textContent;
                    total_all.textContent = (t1 + ship1).toFixed (0).replace (/\B(?=(\d{3})+(?!\d))/g, ",") + " đ";;
                } else {
                    // Nếu value khác 0, tức là có áp dụng mã giảm giá
                    // Lấy giá trị giảm giá của sách thông qua id là value của select
                    var promotion = promotions.find(p => p.id == value); // Sử dụng hàm find() để tìm ra promotion có id bằng với value
                    var discount = Number(promotion.discount_percent); // Lấy ra giá trị discount_percent của promotion tương ứng
                    // Tính toán giá trị sau khi giảm giá
                    var afterDiscount = total * (100 - discount) / 100;
                    // Gán giá trị của afterDiscount cho total_money_1 và total_all
                    total_money_1.textContent = afterDiscount.toFixed (0).replace (/\B(?=(\d{3})+(?!\d))/g, ",") + " đ";
                    total_all.textContent = (afterDiscount + ship1).toFixed (0).replace (/\B(?=(\d{3})+(?!\d))/g, ",") + " đ";;
                }
            });

        </script>
    </body>
</html>