@extends('templates.layout')
@section('content')
<div class = "card-wrapper container">
        <!-- card left -->
    <form action="{{ route('add_to_cart',['id' => $book->id]) }}" method="post" class="p" id="p_submit">
        @csrf
        <div class = "card row ">
            <div class = "product-imgs col-lg-4 ">
                <div class = "img-display">
                    <div class = "img-showcase ">
                        <img  class = "img-responsive img" src = "{{ Storage::url($book->image) }}">
                        @foreach ($images as $image)
                            <img class = "img-responsive" src = "{{ Storage::url($image->image) }}">
                        @endforeach
                        
                    </div>
                    </div>
                    <div class = "img-select">
                    <div class = "img-item">
                        <a href = "#" data-id = "1">
                            <img style = "width: 100px; height: 100px" src = "{{ Storage::url($book->image) }}">
                        </a>
                    </div>
                    <span hidden>{{ $i=1 }}</span>
                    @foreach ($images as $image)
                        <span hidden>{{ $i+=1 }}</span>
                        <div class = "img-item">
                            <a href = "#" data-id = "{{ $i }}">
                                <img style = "width: 100px; height: 100px" src = "{{ Storage::url($image->image) }}">
                            </a>
                        </div>
                    @endforeach
                    
                </div>
            </div>
            <!-- card right -->
            <div class = "product-content col-lg-8">
                <h2 class = "product-title">{{ $book->book_title }}</h2>
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
                    <span>{{ round($book->avg_rating,1) }}({{ $book->total_reviews }})</span>
                </div>

                <div class = "product-price" style="display: flex">
                    @if ($book->promotion_price)
                        <h3 style="color: red; font-weight: bold">{{number_format($book->promotion_price, 0, '', ',')  }}</h3>
                        <h4 style="opacity: 0.6; font-weight: bold; margin-left: 20px; margin-top: 10px;" class="text-decoration-line-through">{{number_format($book->price, 0, '', ',')  }} đ</h4>
                        <span style="padding: 5px; height: 100%; border-radius: 20px; background: red; color: aliceblue; font-weight: bold">- {{ round(($book->price - $book->promotion_price)*100/$book->promotion_price)  }}  %</span>
                    @else
                        <h3 style="color: red; font-weight: bold">{{number_format($book->price, 0, '', ',')  }} đ</h3>
                    @endif     
                </div>

                <div class="product_info row">
                    <div class="col-lg-6">
                        <span>Tác Giả: </span>
                        @foreach ($book->author_name as $author)
                            <span><strong>{{  $author }}</strong>,</span>
                        @endforeach
                    </div>
                    <div class="col-lg-6">
                        <span>Nhà cung cấp: <strong><a href="#">{{ $book->publisher_name }}</a></strong></span><br>
                        <span>Nhà xuất bản: <strong>{{ $book->publisher_name }}</strong></span>
                    </div>
                </div>

                <div class = "purchase-info" >
                    <div class="total_sell">
                        <span>Đã Bán: {{ $book->sold}} sản phẩm</span><br>
                    </div>
                    <div class="quantity_status">
                        <span>Tình trạng:  <strong>{{ $book->quantity >0 ? "Còn hàng" : "Hết hàng" }}</strong></span>
                    </div>
                    <span style="font-size:20px">Số Lượng:</span><input style="margin-left: 20px;" type = "number" name="quantity" min = "1" value = "1">
                    <span style="font-size:20px;opacity: 0.7;">{{ $book->quantity }} sản phẩm có sẵn</span>
                    {{-- <button type = "button" class = "btn">Compare</button> --}}
                </div>
                <hr>
                <div class="more_info">
                    <h4>Thông tin kèm theo</h4>
                    <span><i class="fa-solid fa-circle-check"></i> Chính sách đổi trả: Đổi trả sản phẩm trong 30 ngày</span><br>
                    <span><i class="fa-solid fa-circle-check"></i> Miễn phí giao hàng toàn quốc cho đơn hàng trên 150.000 vnđ. </span><br>
                    <span><i class="fa-solid fa-circle-check"></i> Phí vận chuyển: 15.000 vnđ</span>
                </div>
                <hr>
                <div class="purchase-info" style="margin-top: 0 !important;">
                    <button id = "btn_buy" class = "btn btn_buy1"> Thêm vào giỏ hàng <i class = "fas fa-shopping-cart"></i></button>
                </div>

                <div class = "social-links">
                    <p style="margin-bottom:0">Share At: </p>
                    <a href = "#">
                        <i class = "fab fa-facebook-f"></i>
                    </a>
                    <a href = "#">
                        <i class = "fab fa-twitter"></i>
                    </a>
                    <a href = "#">
                        <i class = "fab fa-instagram"></i>
                    </a>
                    <a href = "#">
                        <i class = "fab fa-whatsapp"></i>
                    </a>
                    <a href = "#">
                        <i class = "fab fa-pinterest"></i>
                    </a>
                </div>
            </div>
        </div>
    </form>

    <div class="detail_description row">
        <h1>Mô tả sản phẩm</h1>
        <table class="table" >
            <tbody>
                <tr>
                    <td >Mã Hàng</td>
                    <td colspan="">{{ $book->id }}</td>
                </tr>
                <tr>
                    <td >Tên nhà cung cấp</td>
                    <td colspan=""><a href="#"><strong>{{ $book->publisher_name }}</strong></a></td>
                </tr>
                <tr>
                    <td >Tác Giả</td>
                    <td colspan="">
                        @foreach ($book->author_name as $author)
                            <span><strong>{{  $author }}</strong>,</span>
                        @endforeach
                    </td>
                </tr>
                <tr>
                    <td >Nhà xuất bản</td>
                    <td colspan="">{{ $book->publisher_name }}</td>
                </tr>
                <tr>
                    <td >Năm xuất bản</td>
                    <td colspan="">{{ $book->publishing_year }}</td>
                </tr>
            </tbody>
        </table>
        <h5>Giá sản phẩm trên T-Book đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...</h5>
        <hr>
        <div>
            <h3 style="text-align:center;color:#008080;">{{ $book->book_title }}</h3>
            <pre style="font-family: Arial, sans-serif; font-size: 14px; line-height: 1.5;white-space: pre-wrap;">{{ $book->description }}</pre>
        </div>
        
    </div>
    <div class="feedback row">
        <h1>Đánh giá sản phẩm</h1>
        <div class="rating row">
            <b>
                <span style="font-size: 25px">{{  $book->avg_rating ? round($book->avg_rating,1)  : 0 }}/</span>5 ({{ $book->total_reviews }} đánh giá)
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
                </div>
            </b>
            <hr>
            <div class="reviews">
              
                @if (!empty($reviews[0]))
                    @foreach ($reviews as $review)
                        <img src="{{ Storage::url($review->image) }}" alt="">
                        <span>{{ $review->user_name }}</span><br>
                        <div class = "review-rating">
                            @for ($i = 1; $i <= $review->rating; $i++)
                                <i class = "fas fa-star" style = "color: #ffc107"></i>
                            @endfor
                            @for ($i = 1; $i <= (5 - $review->rating); $i++)
                                <i class = "fas fa-star" style="color: gainsboro"></i>
                            @endfor 
                        </div>
                        <div class="review-comment">
                            {{ $review->comment }}
                            <br>
                            <span style = "color: grey;">{{ $review->created_at }}</span>
                        </div>
                        <hr>
                    @endforeach
                @else
                    <span style="font-size:20px;">Chưa có bình luận nào về sản phẩm này</span>
                @endif
                
            </div>
            <hr>
            <div class="write-comment">
                @if (Auth::user())
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa-solid fa-pen"></i> <span style = "margin-left: 5px;">Viết bình luận</span>
                    </button>
                    @if (Session::has('success'))
                        <strong style="color: green">{{ Session::get('success') }}</strong>
                    @endif
                    @if (Session::has('errors'))
                        <strong style="color: red">{{ Session::get('errors') }}</strong>
                    @endif
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog-centered modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Bình luận của bạn</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                                </div>
                                <div class="modal-body">
                                    <form action="{{ route('rating_review') }}" method="post" id="form-rating" onsubmit="return check()">
                                        @csrf
                                        <input hidden name="book_id" value="{{$book->id}}">
                                        <div class="form-group">
                                            <label for="">Rating: </label>

                                            <input type="radio" class="btn-check" name="rating" id="check_s1" autocomplete="off" value="1">
                                            <label for="check_s1"><i class = "fas fa-star" id="s1"></i></label>
                                            
                                            <input type="radio" class="btn-check" name="rating" id="check_s2" autocomplete="off" value="2">
                                            <label for="check_s2"><i class = "fas fa-star" id="s2"></i></label>
                                            
                                            <input type="radio" class="btn-check" name="rating" id="check_s3" autocomplete="off" value="3">
                                            <label for="check_s3"><i class = "fas fa-star" id="s3"></i></label>
                                            
                                            <input type="radio" class="btn-check" name="rating" id="check_s4" autocomplete="off" value="4">
                                            <label for="check_s4"><i class = "fas fa-star" id="s4"></i></label>
                                            
                                            <input type="radio" class="btn-check" name="rating" id="check_s5" autocomplete="off" value="5">
                                            <label for="check_s5"><i class = "fas fa-star" id="s5"></i></label>
                                            <span  style="color: red" id="error_rating"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Bình luận</label>
                                            <textarea name="comment" id="comment" class="form-control" id="" cols="30" rows="10"></textarea>
                                            <span style="color: red" id="error_comment" ></span>
                                        </div>                
                                    </form>
                                </div>
                                <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" id="btn_submit" form="form-rating">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                @else
                    <span style="color:red; font-size:20px"><a href="{{ route('login') }}">Đăng nhập</a> để bình luận</span>
                @endif
                
            </div>
        </div>
    </div>
    <div class="product">
        <div class="container">
            <div class="product_txt">
                * Sách Liên Quan *
            </div>
            <div class="product_item">
                <button class="pre-btn"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="nxt-btn"><i class="fa-solid fa-chevron-right"></i></button>
                <div class="row product_item_card ">
                    @foreach ($similar_books as $book)
                            <div class="product_item_1 col-lg-3 col-md-4 col-sm-6" >
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
                                                <h6>{{number_format($book->promotion_price, 0, '', ',')  }}đ</h6>
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
        
                </div>
                <hr>
                <div class="d-grid gap-2 col-4 mx-auto ">
                    <a href="#" class="btn_all btn btn-outline-primary" >Xem Thêm</a>
                </div>
            </div>
        </div>
    </div>
</div>

    <script>
        const productContainers = [...document.querySelectorAll('.product_item_card')];
        const nxtBtn = [...document.querySelectorAll('.nxt-btn')];
        const preBtn = [...document.querySelectorAll('.pre-btn')];
        productContainers.forEach((items, i) => {
            nxtBtn[i].addEventListener('click', () => {
                let containerDimensions = items.getBoundingClientRect();
                let containerWidth = containerDimensions.width;
                items.scrollLeft += containerWidth;
            })
            
            preBtn[i].addEventListener('click', () => {
                let containerDimensions = items.getBoundingClientRect();
                let containerWidth = containerDimensions.width;
                items.scrollLeft -= containerWidth;
            })
            
        }) 
    </script>

    <script>
        const imgs = document.querySelectorAll('.img-select a');
        const imgBtns = [...imgs];
        let imgId = 1;

        imgBtns.forEach((imgItem) => {
            imgItem.addEventListener('click', (event) => {
                event.preventDefault();
                imgId = imgItem.dataset.id;
                slideImage();
            });
        });

        function slideImage(){
            const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

            document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
        }

        window.addEventListener('resize', slideImage);

        // phần rating
        var kt=false;
        const stars = document.querySelectorAll('.form-group label i');
        stars.forEach((star,index1)=>{
            star.addEventListener('click', ()=>{
                stars.forEach((star,index2)=>{
                    index1 >= index2 ? star.classList.add('active') : star.classList.remove('active');
                });
                kt=true;
            })
        })

        // const form = document.querySelector('#form_rating');
        
        function check(){
            $kt1=true;
            if(kt == false){
                document.querySelector('#error_rating').innerHTML = "Chưa đánh giá cho sản phẩm";
                kt1 = false;
            }else{
                document.querySelector('#error_rating').innerHTML = "";
            }

            if(document.querySelector('#comment').value.trim() == ''){
                document.querySelector('#error_comment').innerHTML = "Chưa bình luận cho sản phẩm";
                kt1 = false;
            }else{
                document.querySelector('#error_comment').innerHTML = "";
            }
            if(document.querySelector('#comment').value.trim() != '' && kt != false){
                kt1 = true;
            }
            return kt1;
        }

    </script>

    <script>

        // Khai báo biến canSubmit và gán giá trị false
        var canSubmit = false;
        // Lấy ra đối tượng nút .btn_buy1
        var button = document.querySelector(".btn_buy1");
        // Bắt sự kiện click của nút .btn_buy1
        button.addEventListener("click", function (e) {
        // Ngăn chặn sự kiện click mặc định
        e.preventDefault();
        // Lấy ra đối tượng form từ nút .btn_buy1
        var form = button.closest("#p_submit");
        // Lấy ra các thông tin cần thiết từ form
        var cart = document.querySelector("#cart");
        var src = form.querySelector("img").getAttribute("src");
        var href = form.getAttribute("action");
        var parTop = form.offsetTop;
        var parLeft = form.offsetLeft;
        console.log(form);
        // Tạo một ảnh mới với class là .img-product-fly và src là src của ảnh sản phẩm
        var img = document.createElement("img");
        img.setAttribute("class", "img-product-fly");
        img.setAttribute("src", src);
        img.style.top = parTop + "px";
        img.style.left = parLeft + 75 + "px";
        // Thêm ảnh mới vào body
        document.body.appendChild(img);
        // Thiết lập một hàm gọi lại sau 500 mili giây
        setTimeout(function () {
            // Thay đổi vị trí của ảnh mới thành vị trí của giỏ hàng
            img.style.top = cart.offsetTop + "px";
            img.style.left = cart.offsetLeft + "px";
            // Thiết lập một hàm gọi lại khác sau 1000 mili giây
            setTimeout(function () {
            // Xóa ảnh mới khỏi body
            document.body.removeChild(img);
            // Đặt canSubmit thành true
            canSubmit = true;
            // Kiểm tra nếu canSubmit là true thì mới submit form
            if (canSubmit) {
                // Gọi phương thức submit của form
                form.submit();
            }
            }, 1000);
        }, 500);
        });
    </script>
@endsection