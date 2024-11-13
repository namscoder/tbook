@extends('templates.layout_admin')
@section('content')
    <div class="content_admin">
        @if (Session::has('success'))
            <strong style="color: green">{{ Session::get('success') }}</strong> <br>
        @endif
        <table class="table ">
            <thead>
                <tr>
                    <th>Book Title</th>
                    <th>Image</th>
                    <th>Average Rating</th>
                    <th>Total Review</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($books as $book)
                    <tr>
                        <td>{{ $book->book_title }}</td>
                        <td><img style="width: 150px; height: 150px;" src="{{ Storage::url($book->image) }}" alt=""></td>
                        <td>
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
                        </td>
                        <td>{{ $book->total_reviews }}</td>
                        <td>
                            <a href="{{ route('book_review_detail',['id'=>$book->id]) }}" class = "btn btn-outline-primary">Book Review Detail</a><br>
                            <a  href="{{ route('delete_book_review',['id'=>$book->id]) }}" onclick="return confirm('Do you want to delete this book review?')"style="margin-top: 10px;" class = "btn btn-outline-danger">Delete All Book Reviews</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        {{ $books->links() }}
    </div>
@endsection