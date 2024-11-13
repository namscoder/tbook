@extends('templates.layout_admin')
@section('content')
    <div class="action row">
        <div class="col-lg-4">
            <img src="{{ Storage::url($book->image) }}" style="width: 100%;">
            <h3>{{ $book->book_title }}</h3>
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
            <a href="{{ route('reviews') }}" class="btn btn-primary">Reviews</a>
        </div>
        <div class="col-lg-8">
            <h5>Book Review Details</h5>
            @if (Session::has('success'))
                <strong style="color: green">{{ Session::get('success') }}</strong> <br>
            @endif
            <div class="reviews" style="padding-left: 20px;">
                @if (!empty($reviews[0]))
                    @foreach ($reviews as $review)
                        <img style="width: 75px; height: 75px; border-radius: 50%" src="{{ Storage::url($review->image) }}" alt="">
                        <span>{{ $review->user_name }}</span>
                        <br>
                        <div class = "review-rating" style="padding-left: 50px">
                            @for ($i = 1; $i <= $review->rating; $i++)
                                <i class = "fas fa-star" style = "color: #ffc107"></i>
                            @endfor
                            @for ($i = 1; $i <= (5 - $review->rating); $i++)
                                <i class = "fas fa-star" style="color: gainsboro"></i>
                            @endfor 
                        </div>
                        <div class="review-comment row" style="padding-left: 50px;">
                            <p class = "col-lg-8"> 
                                {{ $review->comment }}
                                <br>
                                <span style = "color: grey;">{{ $review->created_at }}</span>
                            </p>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end col-lg-4" style="height: auto;">
                                <a href="{{ route('delete_review',['id'=>$review->id]) }}" style="height: 40px;" class="btn btn-outline-danger">Delete</a>
                            </div>
                        </div>
                        <hr>
                    @endforeach      
                @else
                    <span style="font-size:20px;">Chưa có bình luận nào về sản phẩm này</span>
                @endif       
            </div>
        </div>
    </div>
@endsection