<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ReviewController extends Controller
{
    //
    public function store(Request $request)
    {
        $data = $request->all();
        $review = DB::table('reviews')
            ->where('user_id', Auth::user()->id)
            ->where('book_id', $data['book_id'])
            ->first();
        $data['user_id'] = Auth::user()->id;
        if ($review) {
            Session::flash('errors', 'Bạn đã bình luận cho sản phẩm này rồi');
            return redirect()->back();
        } else {
            $review_add = Review::create($data);
            if ($review_add) {
                Session::flash('success', 'Bình luận sản phẩm thành công');
                return redirect()->back();
            }
        }
    }

    public function list()
    {
        // lấy sô bình luận và đánh giá của từng sách
        $books = DB::table('books')
            ->join('reviews', 'reviews.book_id', '=', 'books.id')
            ->select(
                'books.id',
                'books.book_title',
                'books.price',
                'books.promotion_price',
                'books.quantity',
                'books.image',
                DB::raw('avg(reviews.rating) as avg_rating'),
                DB::raw('count(reviews.id) as total_reviews')
            )
            ->groupBy('books.id', 'books.book_title', 'books.price', 'books.promotion_price', 'books.quantity', 'books.image')
            ->orderBy('avg_rating', 'desc')
            ->paginate(8);
        return view('reviews.list', compact('books'));
    }

    public function book_review_detail($id)
    {
        $reviews = DB::table('reviews')
            ->join('users', 'users.id', '=', 'reviews.user_id')
            ->join('books', 'books.id', '=', 'reviews.book_id')
            ->where('reviews.book_id', $id)
            ->select('users.name as user_name', 'users.image', 'reviews.id', 'reviews.rating', 'reviews.comment', 'reviews.created_at')
            ->get();
        $book = DB::table('books')
            ->join('reviews', 'reviews.book_id', '=', 'books.id')
            ->select(
                'books.id',
                'books.book_title',
                'books.price',
                'books.promotion_price',
                'books.quantity',
                'books.image',
                DB::raw('avg(reviews.rating) as avg_rating'),
                DB::raw('count(reviews.id) as total_reviews')
            )
            ->groupBy('books.id', 'books.book_title', 'books.price', 'books.promotion_price', 'books.quantity', 'books.image')
            ->where('books.id', $id)
            ->first();
        return view('reviews.review_details', compact('reviews', 'book'));
    }

    public function delete_review($id)
    {
        $review_DL = Review::where('id', $id)->delete();
        if ($review_DL) {
            Session::flash('success', 'Delete Review Successfully');
        }
        return redirect()->back();
    }

    //
    public function delete_book_review($id)
    {
        $review_DL = Review::where('book_id', $id)->delete();
        if ($review_DL) {
            Session::flash('success', 'Delete Book Review Successfully');
        }
        return redirect()->back();
    }
}
