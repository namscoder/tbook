@extends('templates.layout')
@section('content')
    <div class="product_book">     
        <div class="container">
            <div class="breadcrumb">
                @if (isset($parent_categories)) 
                    <span><a href="{{ route('home') }}">TRANG CHỦ</a></span>
                    <span><i class="fa-solid fa-chevron-right"></i></span>
                    <span><a href="{{ route('product',['id' => 0]) }}">Danh Mục</a></span>
                    <span><i class="fa-solid fa-chevron-right"></i></span>
                    @foreach ($parent_categories as $parent_category)
                        <span><a href="#">{{ $parent_category->category_name }}</a></span>
                        <span><i class="fa-solid fa-chevron-right"></i></span>
                    @endforeach
                    <span style="color:red">{{ $current_category->category_name ?? '' }}</span>
                @endif
              </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-12 product_book_t1">
                    <h4>Nhóm sản phẩm</h4>
                    <div>
                        <ul class="menu">
                            <li>
                                <a href="{{ route('product') }}">Danh mục</a><i class="fa-solid fa-chevron-right"></i>
                                <ul class="submenu_mobile">
                                    @foreach ($categories as $category)
                                        @if ($category->cate_id == null) <!-- Nếu là danh mục gốc -->
                                            <li>
                                                <a href="{{ route('product',['id' => $category->id]) }}">{{ $category->category_name }}</a>
                                                @if ($category->children->count() > 0) <!-- Nếu có danh mục con -->
                                                    <i class="fa-solid fa-chevron-right"></i>
                                                    @include('clients.submenu_mobile', ['subcategories' => $category->children]) <!-- Gọi đệ quy view con -->
                                                @endif
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            </li>
                        </ul>
                    </div> 
                    <hr> 
                    {{-- Lọc sản phẩm --}}
                    
                    <form action="" method="get" id="submit" >
                        @if (session()->get('search') != '')
                            <input type="text" hidden name="search" value="{{ session()->get('search') ?? '' }}">                            
                        @endif
                        {{-- Lọc theo giá sản phẩm  --}}
                        <h4>Giá</h4>
                        <div class="product_book_t1_price">
                            <div class="form-check">
                                <input class="form-check-input check_price" name="price1" {{ Request::get('price1') == "0-150.000"  ? 'checked' : ''}} type="checkbox" value="0-150.000" id="price1">
                                <label class="form-check-label" for="price1">
                                    {{-- <a href="{{ request()->fullUrlWithQuery(['price_1' => '0-150.000'])}}">0 - 150.000đ</a> --}}
                                    0 - 150.000đ
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input check_price" name="price2" {{ Request::get('price2') == '150.000-300.000' ? 'checked' : ''}} type="checkbox" value="150.000-300.000" id="price2">
                                <label class="form-check-label" for="price2">
                                    150.000đ - 300.000đ
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input check_price" name="price3" {{ Request::get('price3') == "300.000-500.000"  ? 'checked' : ''}} type="checkbox" value="300.000-500.000" id="price3">
                                <label class="form-check-label" for="price3">
                                    {{-- <a href="{{ request()->fullUrlWithQuery(['price_1' => '0-150.000'])}}">0 - 150.000đ</a> --}}
                                    300.000đ - 500.000đ
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input check_price" name="price4" {{ Request::get('price4') == '500.000-700.000' ? 'checked' : ''}} type="checkbox" value="500.000-700.000" id="price4">
                                <label class="form-check-label" for="price4">
                                    500.000đ - 700.000đ
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input check_price" name="price5" {{ Request::get('price5') == '>700.000' ? 'checked' : ''}} type="checkbox" value=">700.000" id="price5">
                                <label class="form-check-label" for="price5">
                                    từ 700.000đ trở lên
                                </label>
                            </div> 
   
                        </div>
                         {{-- Lọc theo đánh giá sản phẩm  --}}
                        <hr>
                        <h4>Đánh Giá</h4>
                        <div class="rate" style="padding-left: 20px;">
                            <div class="form-check">
                                <input class="form-check-input " onchange="checkOnlyOne(this);" name="star" hidden {{ Request::get('star') == "5"  ? 'checked' : ''}} type="checkbox" value="5" id="star5">
                                <label class="form-check-label" for="star5">
                                    <ul class="star_filter {{ Request::get('star') == "5"  ? 'active_star' : ''}}">
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                    </ul>  
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input " onchange="checkOnlyOne(this);" name="star" hidden {{ Request::get('star') == "4"  ? 'checked' : ''}} type="checkbox" value="4" id="star4">
                                <label class="form-check-label" for="star4">
                                    <ul class="star_filter {{ Request::get('star') == "4"  ? 'active_star' : ''}}">
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input " onchange="checkOnlyOne(this);" name="star" hidden {{ Request::get('star') == "3"  ? 'checked' : ''}} type="checkbox" value="3" id="star3">
                                <label class="form-check-label" for="star3">
                                    <ul class="star_filter {{ Request::get('star') == "3"  ? 'active_star' : ''}}">
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input " onchange="checkOnlyOne(this);" name="star" hidden {{ Request::get('star') == "2"  ? 'checked' : ''}} type="checkbox" value="2" id="star2">
                                <label class="form-check-label" for="star2">
                                    <ul class="star_filter {{ Request::get('star') == "2"  ? 'active_star' : ''}}">
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input " onchange="checkOnlyOne(this);" name="star" hidden {{ Request::get('star') == "1"  ? 'checked' : ''}} type="checkbox" value="1" id="star1">
                                <label class="form-check-label" for="star1">
                                    <ul class="star_filter {{ Request::get('star') == "1"  ? 'active_star' : ''}}">
                                        <li class="yellow"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                        <li class="gainsboro"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                </label>
                            </div>
                        </div>
                    </form> 
                   <hr>
                   
                </div>
                <div class="col-lg-9 col-md-8 col-sm-12 product_book_t2">
                    <div class="row">
                        @if (count($books))
                            @foreach ($books as $book)
                                <div class="product_book_item col-lg-3 col-md-4 col-sm-6" >
                                    <form action="" method="post" class="p">
                                        <a href="{{ route('product_detail',['id'=>$book->id]) }}">
                                            <div class="img">
                                                <img class="rounded" src="{{ Storage::url($book->image) }}" alt="">
                                            </div>
                                            <div class="title">
                                                <h5 style="width: 100%; overflow: hidden; text-overflow: ellipsis; line-height: 25px; -webkit-line-clamp: 2; height: 50px; display: -webkit-box; -webkit-box-orient: vertical;">
                                                    {{ $book->book_title }}
                                                </h5>
                                            </div>
                                            <div class="price">
                                                @if ($book->promotion_price >0)
                                                    <h6>
                                                        {{number_format($book->promotion_price, 0, '', ',')  }}đ
                                                        <span style="padding: 0 5px;position: absolute; font-size:17px;margin-bottom: 10px;  
                                                        border-radius: 20px; background: red; color: aliceblue; font-weight: bold">
                                                            - {{ round(($book->price - $book->promotion_price)*100/$book->price)  }}  %
                                                        </span>  
                                                    </h6>
                                                    <del class="text-decoration-line-through">{{ number_format($book->price, 0, '', ',') }}đ</del>
                                                @else
                                                    <h6>{{number_format($book->price , 0, '', ',') }}đ</h6>
                                                @endif
                                            </div>
                                            <div class = "product-rating">
                                                @php
                                                    $stars = array_fill(0, 5, '<i class = "fas fa-star"></i>');
                                                    // Đổ màu vàng vào sao dựa trên giá trị của $a
                                                    for ($i = 0; $i < floor($book->avg_rating); $i++) {
                                                        // Đổi màu sao thứ $i thành vàng
                                                        $stars[$i] = '<i class = "fas fa-star" style="color: #ffd700;"></i>';
                                                    }
                                                    // Nếu $a không phải là số nguyên, đổ màu vàng vào một nửa của sao thứ $a
                                                    if ($book->avg_rating != floor($book->avg_rating)) {
                                                        // Đổi màu một nửa của sao thứ $a thành vàng
                                                        $stars[floor($book->avg_rating)] = '<i class = "fas fa-star-half-alt" style="color: #ffd700;"></i>';
                                                    }
                                                    // Đổ màu nâu vào những sao còn lại
                                                    for ($i = ceil($book->avg_rating); $i < 5; $i++) {
                                                        // Đổi màu sao thứ $i thành nâu
                                                        $stars[$i] = '<i class = "fas fa-star" style="color: gainsboro;"></i>';
                                                    }
                                                    echo implode('', $stars);
                                                @endphp
                                                <span>({{ $book->total_reviews }})</span>
                                            </div>
                                        </a> 
                                        <div class="d-grid gap-2 ">
                                            <a href="{{ route('add_to_cart',['id' => $book->id]) }}" id="btn_buy" class="btn_buy btn btn-primary"><i class="fa-solid fa-bag-shopping"></i> Thêm vào giỏ hàng</a>
                                        </div>
                                    </form>
                                </div>
                            @endforeach
                        @else
                            <span style="font-size: 25px; margin-left: 20px;">Không có sản phẩm nào thỏa mãn yêu cầu</span>
                        @endif
                    </div>
                    <div style="margin-top: 20px;">
                        {{ $books->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var autoSubmitInputPrice = document.querySelectorAll(".check_price");
            // Gán sự kiện change cho input
            autoSubmitInputPrice.forEach(function(element) { // duyệt qua từng phần tử
                element.addEventListener("change", function() { // gắn sự kiện change cho phần tử
                    document.getElementById("submit").submit(); // gửi form có id là submit
                });
            });
            // var radios = document.getElementsByName('star'); // Lấy tất cả radio input
            // var prevRadio = null; // Khởi tạo biến để lưu radio input trước đó
            // function toggleRadio(radio) {
            //     // Kiểm tra nếu radio button đã được chọn trước đó
            //     if (radio.checked && radio.getAttribute("data-checked") === "true") {
            //         // Nếu đã chọn, hủy chọn và cập nhật thuộc tính "data-checked"
            //         radio.checked = false;
            //         radio.setAttribute("data-checked", "false");
            //     } 
            //     // Gửi form nếu cần
            //     document.getElementById("submit").submit(); // gửi form có id là submit
            // }

            //     // Thêm sự kiện 'click' cho mỗi radio button
            // window.onload = function() {
            //     var radios = document.getElementsByName('star'); // Lấy tất cả radio input
            //     radios.forEach(function(radio) {
            //         radio.setAttribute("data-checked", "false"); // Khởi tạo thuộc tính "data-checked"
            //         radio.onclick = function() {
            //             toggleRadio(this);
            //         };
            //     });
            // };
            var checkedBox = null; // biến để lưu checkbox đã được chọn trước đó
            function checkOnlyOne(checkbox) {
                var checkboxes = document.getElementsByName('star'); // Lấy tất cả checkbox
                checkboxes.forEach(function(item) {
                    if (item !== checkbox) item.checked = false; // Bỏ chọn những checkbox khác
                });
                if (checkedBox == checkbox) { // Kiểm tra nếu checkbox đã được chọn trước đó
                    checkbox.checked = false; // Hủy chọn checkbox
                    checkedBox = null; // Cập nhật biến lưu trạng thái
                } else {
                    checkedBox = checkbox; // Cập nhật biến lưu trạng thái
                }
                document.getElementById("submit").submit();
            }
            // function sendForm(checkbox) {
            //     if (checkbox.checked) { // kiểm tra nếu checkbox được chọn
            //         document.getElementById("submit").submit(); // gửi form có id là myForm
            //     }
            // }
    </script>
@endsection