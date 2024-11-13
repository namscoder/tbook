<?php

namespace App\Http\Controllers;

use App\Http\Requests\CategoryRequest;
use App\Models\Book;
use App\Models\Cart;
use App\Models\Category;
use App\Models\List_Image;
use App\Models\Order_Detail;
use App\Models\Participate;
use App\Models\Review;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

use function Laravel\Prompts\select;

class CategoryController extends Controller
{
    //
    public function index(request $request)
    {
        $categories = Category::
        leftjoin('categories as c', 'c.id', '=', 'categories.cate_id')
        ->select('categories.*','c.category_name as cate_name')
        ->paginate(10);
        $title = "List of Category";
        return view('categories.list', compact(['categories', 'title']));
    }

    public function store(CategoryRequest $request)
    {
        $title = "Add Book Category";
        if ($request->isMethod('POST')) {
            $params = $request->except('_token');
            $category = Category::create($params);
            if ($category->id) {
                Session::flash('success', 'Add new Book Category Successfully');
            }
        }
        $categories = Category::all();
        return view('categories.store', compact(['title', 'categories']));
    }
    public function checkCategory($id)
    {
        //$category = DB::table('categories')->where('id', $id)->first();
        $parent_category = Category::where('cate_id', $id)->get();
        $a = [];
        if ($parent_category) {
            foreach ($parent_category as $pa) {
                $a[] = $pa->id;
            }
        }
        return $a;
    }

    public function update(CategoryRequest $request, $id)
    {
        $title = "Update Book Category";
        $category = DB::table('categories')->where('id', $id)->first();
        $parent_category[] = $this->checkCategory($id);
        $arr = array_reduce($parent_category, 'array_merge', []);

        while (true) {
            $a = [];
            for ($i = 0; $i < count($parent_category); $i++) {
                if (!empty($this->checkCategory($parent_category[$i]))) {
                    $a[] = $this->checkCategory($parent_category[$i]);
                    $a = array_reduce($a, 'array_merge', []);
                }
            }
            if (!empty($a)) {
                $arr = array_merge($arr, $a);
                $parent_category = $a;
                $a = [];
            } else {
                break;
            }
        }
        array_push($arr, (int)$id);
        $m = '';
        if ($request->isMethod('POST')) {
            $params = $request->except('_token');
            $cate_id = (int)$params['cate_id'];
            if (in_array($cate_id, $arr)) {
                $m = "Không thể đặt danh mục cha thành danh mục con của danh mục con (hoặc chính nó)";
            } else {
                $category = Category::where('id', $id)->update($params);
                if ($category) {
                    Session::flash('success', 'Update Book Category Successfully');
                    return redirect()->route('edit_category', ['id' => $id]);
                }
            }
        }
        $parent_id = $category->cate_id;
        $parent = '';
        if ($parent_id) {
            $parent = Category::where('id', $parent_id)->first();
        }
        $categories = Category::all();
        return view('categories.update', compact(['title', 'category', 'categories', 'parent', 'm']));
    }
    public function destroy($id)
    {
        if (!empty($this->checkCategory($id))) {
            $parent_category[] = $this->checkCategory($id);
            $arr = array_reduce($parent_category, 'array_merge', []);
            while (true) {
                $a = [];
                for ($i = 0; $i < count($parent_category); $i++) {
                    if (!empty($this->checkCategory($parent_category[$i]))) {
                        $a[] = $this->checkCategory($parent_category[$i]);
                        $a = array_reduce($a, 'array_merge', []);
                    }
                }
                if (!empty($a)) {
                    $arr = array_merge($arr, $a);
                    $parent_category = $a;
                    $a = [];
                } else {
                    break;
                }
            }
            for ($i = (count($arr) - 1); $i >= 0; $i--) {
                //lấy ra các sách thuộc danh mục con
                $books = DB::table('books')->where('cate_id', $arr[$i])->whereNull('deleted_at')->get();

                //xóa ảnh trong storage
                foreach ($books as $book) {
                    // $resultDL = Storage::delete('/public/' . $book->image);
                    //xóa ảnh album trong storage
                    $albums = DB::table('list_images')->where('book_id', $book->id)->get();
                    foreach ($albums as $album) {
                        $album_image_dl = Storage::delete('/public/' . $album->image);
                    }

                    //xóa mềm các bảng liên quan mối quan hệ với books
                    $cartDL = Cart::where('book_id', $book->id)->delete();
                    $reviewDL = Review::where('book_id', $book->id)->delete();
                    $participateDL = Participate::where('book_id', $book->id)->delete();
                    $list_imageDL = List_Image::where('book_id', $book->id)->delete();
                    $order_detailDL = Order_detail::where('book_id', $book->id)->delete();
                    $bookDL = Book::where('id', $book->id)->delete();
                }
                //xóa các sách và ảnh của sách ở danh mục đó
                $categoryDL = Category::where('id', $arr[$i])->delete();
            }
        }

        //lấy sách thuộc danh mục cần xóa
        $books = DB::table('books')->where('cate_id', $id)->whereNull('deleted_at')->get();

        //xóa ảnh trong storage
        foreach ($books as $book) {
            // $resultDL = Storage::delete('/public/' . $book->image);
            //xóa ảnh album trong storage
            $albums = DB::table('list_images')->where('book_id', $book->id)->get();
            foreach ($albums as $album) {
                $album_image_dl = Storage::delete('/public/' . $album->image);
            }

            //xóa mềm các bảng liên quan mối quan hệ với books
            $cartDL = Cart::where('book_id', $book->id)->delete();
            $reviewDL = Review::where('book_id', $book->id)->delete();
            $participateDL = Participate::where('book_id', $book->id)->delete();
            $list_imageDL = List_Image::where('book_id', $book->id)->delete();
            $order_detailDL = Order_detail::where('book_id', $book->id)->delete();
            $bookDL = Book::where('id', $book->id)->delete();
        }
        //xóa các sách và ảnh của sách ở danh mục đó
        $categoryDL = Category::where('id', $id)->delete();
        if ($categoryDL) {
            Session::flash('success', 'Delete This Category Successfully');
            return redirect()->route('categories');
        }
    }
}
