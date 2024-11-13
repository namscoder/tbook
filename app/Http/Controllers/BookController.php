<?php

namespace App\Http\Controllers;

use App\Http\Requests\BookRequest;
use App\Models\Author;
use App\Models\Book;
use App\Models\Cart;
use App\Models\Category;
use App\Models\List_Image;
use App\Models\Order_Detail;
use App\Models\Participate;
use App\Models\Publisher;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;

class BookController extends Controller
{
    //
    public function index()
    {
        $books = DB::table('books')
            ->join('categories', 'books.cate_id', '=', 'categories.id')
            ->join('publishers', 'books.publisher_id', '=', 'publishers.id')
            ->select('books.*', 'categories.category_name', 'publishers.publisher_name')
            ->where('books.deleted_at', null)
            ->orderBy('books.id', 'desc')
            ->paginate(10);
        foreach ($books as $book) {
            $id = $book->id;
            $book->author_name = '';
            $authors = DB::table('authors')
                ->join('participates', 'authors.id', '=', 'participates.author_id')
                ->join('books', 'books.id', '=', 'participates.book_id')
                ->where('participates.book_id', $id)
                ->select('author_name')
                ->get();
            foreach ($authors as $author) {
                $book->author_name = $book->author_name . '' . (string)$author->author_name . ',' . html_entity_decode('<br>');
            }
            $book->author_name = substr($book->author_name, 0, -5);
        }
        return view('books.list', compact('books'));
    }

    public function store(BookRequest $request)
    {
        $categories = Category::all();
        $publishers = Publisher::all();
        $authors = Author::all();
        $title = "Add Book";
        $list_images = [];

        if ($request->method('POST')) {

            if ($request->hasFile('image') && $request->file('image')->isValid()) {

                $request->image = uploadFile('image', $request->file('image'));
                $params = $request->except('_token', 'image', 'author_id');
                $params['image'] = $request->image;
                $params['promotion_price'] = $request->promotion_price;
                $book = Book::create($params);
                if ($book->id) {
                    if ($request->list_image) {
                        foreach ($request->list_image as $key => $value) {
                            $list_images[] = uploadFile('image', $value);
                        }
                        for ($i = 0; $i < count($list_images); $i++) {
                            $image = [
                                'image' => $list_images[$i],
                                'book_id' => $book->id
                            ];
                            $images = List_Image::create($image);
                        }
                    }

                    foreach ($request->author_id as $value) {
                        $participate = [
                            'author_id' => $value,
                            'book_id' => $book->id
                        ];
                        $result = Participate::create($participate);
                    }
                    Session::flash('success', "Add Book Successfully");
                }
            }
        }
        return view('books.store', compact(['categories', 'publishers', 'authors', 'title']));
    }

    public function delete_image($id)
    { //xóa ảnh ở phần cập nhật khi click vào dấu x
        $image = DB::table('list_images')->where('id', $id)->first();
        if (Storage::exists('/public/', $image->image)) {
            $resultDL = Storage::delete('/public/' . $image->image);
        }
        List_Image::where('id', $id)->delete();
        Session::flash('success', "Delete image in List image successfully");
        return back();
    }
    public function update(BookRequest $request, $id)
    {
        $title = "Update Book";
        $categories = Category::all();
        $publishers = Publisher::all();
        $authors = Author::all();
        $list_images = DB::table('list_images')->where('book_id', $id)->where('deleted_at', null)->get(); //lấy list ảnh của sách
        //lấy thông tin sách cần cập nhật
        $book = DB::table('books')
            ->join('categories', 'books.cate_id', '=', 'categories.id')
            ->join('publishers', 'books.publisher_id', '=', 'publishers.id')
            ->where('books.id', $id)
            ->select('books.*', 'categories.category_name', 'publishers.publisher_name')
            ->first();
        //lấy ra thông tin tác giả viết sách
        $author_book = DB::table('authors')
            ->join('participates', 'authors.id', '=', 'participates.author_id')
            ->join('books', 'books.id', '=', 'participates.book_id')
            ->where('participates.book_id', $id)
            ->where('participates.deleted_at', null)
            ->select('authors.id')
            ->get();
        $author_books = [];
        foreach ($author_book as $author) {
            array_push($author_books, (int) $author->id);
        }
        //cập nhật sách
        if ($request->isMethod('POST')) {

            $params = $request->except('_token', 'image', 'author_id', 'list_image');

            //cập nhật ảnh mới thì xóa ảnh cũ
            if ($request->hasFile('image') && $request->file('image')->isValid()) {
                $resultDL = Storage::delete('/public/' . $book->image);
                if ($resultDL) {
                    $request->image = uploadFile('image', $request->file('image'));
                    $params['image'] = $request->image;
                } else {
                    $params['image'] = $book->image;
                }
            }

            $params['promotion_price'] = $request->promotion_price;
            $result = DB::table('books')->where('id', $id)->update($params);

            //Nếu chọn ảnh thêm vào list thì upload file
            if (!empty($request->list_image)) {
                $list_images = [];
                foreach ($request->list_image as $key => $value) {
                    if (uploadFile('image', $value))
                        $list_images[] = uploadFile('image', $value);
                }

                for ($i = 0; $i < count($list_images); $i++) {
                    $image = [
                        'image' => $list_images[$i],
                        'book_id' => $book->id
                    ];
                    $images = List_Image::create($image);
                }
            }
            // cập nhật tác giả viết sách (xóa hết participates -> lưu mới)
            if (!empty($request->author_id)) {
                $resultDL = DB::table('participates')->where('book_id', $id)->delete();
                foreach ($request->author_id as $value) {
                    $participate = [
                        'author_id' => $value,
                        'book_id' => $book->id
                    ];
                    $result = Participate::create($participate);
                }
            }
            Session::flash('success', "Update Book Successfully");
            return redirect()->route('edit_book', ['id' => $id]);
        }

        return view('books.update', compact(['title', 'book', 'authors', 'categories', 'authors', 'author_books', 'publishers', 'list_images']));
    }


    public function destroy($id)
    {
        $cartDL = Cart::where('book_id', $id)->delete();
        $reviewDL = Review::where('book_id', $id)->delete();
        $participateDL = Participate::where('book_id', $id)->delete();
        $list_imageDL = List_Image::where('book_id', $id)->delete();
        $order_detailDL = Order_detail::where('book_id', $id)->delete();
        $book = Book::find($id);
        // $resultDL = Storage::delete('/public/' . $book->image);
        $albums = DB::table('list_images')->where('book_id', $book->id)->get();
        foreach ($albums as $album) {
            $album_image_dl = Storage::delete('/public/' . $album->image);
        }
        $bookDL = Book::where('id', $id)->delete();
        if ($bookDL) {
            Session::flash('success', 'Delete Book Successfully');
            return redirect()->route('books');
        }
    }
}
