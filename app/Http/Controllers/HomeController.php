<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class HomeController extends Controller
{
    public function index()
    {
        //Lấy sách nổi bật (sách có rating cao)
        $book_outstandings = DB::table('books')
            ->leftjoin('reviews', 'reviews.book_id', '=', 'books.id')
            ->whereNull('books.deleted_at')
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
            ->where('rating', '>=', 3)
            ->groupBy('books.id', 'books.book_title', 'books.price', 'books.promotion_price', 'books.quantity', 'books.image')
            ->orderBy('avg_rating', 'desc')
            ->paginate(10);
        //lấy ra những sách mới
        $new_books = DB::table('books')
            ->leftJoin('reviews', 'reviews.book_id', '=', 'books.id')
            ->whereNull('books.deleted_at')
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
            ->orderBy('books.id', 'desc')
            ->paginate(10);

        $bestselling_books = DB::table('books')
            ->leftJoin('reviews', 'reviews.book_id', '=', 'books.id')
            ->whereNull('books.deleted_at')
            ->where('books.sold', '>', 0)
            ->select(
                'books.id',
                'books.book_title',
                'books.price',
                'books.promotion_price',
                'books.quantity',
                'books.image',
                'books.sold',
                DB::raw('avg(reviews.rating) as avg_rating'),
                DB::raw('count(reviews.id) as total_reviews'),
            )
            ->groupBy('books.id', 'books.book_title', 'books.price', 'books.promotion_price', 'books.quantity', 'books.image', 'books.sold')
            ->orderBy('books.sold', 'desc')
            ->paginate(10);

        $shocking_discount = DB::table('books')
            ->leftJoin('reviews', 'reviews.book_id', '=', 'books.id')
            ->whereNull('books.deleted_at')
            ->where('books.promotion_price', '>', 0)
            ->select(
                'books.id',
                'books.book_title',
                'books.price',
                'books.promotion_price',
                'books.quantity',
                'books.image',
                DB::raw('avg(reviews.rating) as avg_rating'),
                DB::raw('count(reviews.id) as total_reviews'),
                DB::raw('case when books.promotion_price = 0 then 0 else (books.price - books.promotion_price) * 100 / books.price end as discount_rate')
            )
            ->groupBy('books.id', 'books.book_title', 'books.price', 'books.promotion_price', 'books.quantity', 'books.image')
            ->orderBy('discount_rate', 'desc')
            ->paginate(10);
        return view('clients.home', compact(['book_outstandings', 'new_books', 'bestselling_books', 'shocking_discount']));
    }

    //chi tiết sản phẩm
    public function product_detail($id)
    {
        // thông tin sách
        $book = DB::table('books')
            ->join('categories', 'books.cate_id', '=', 'categories.id')
            ->join('publishers', 'books.publisher_id', '=', 'publishers.id')
            ->select('books.*', 'categories.category_name', 'publishers.publisher_name')
            ->where('books.deleted_at', null)
            ->where('books.id', $id)
            ->first();
        // thông tin tác giả
        $book->author_name = [];
        $authors = DB::table('authors')
            ->join('participates', 'authors.id', '=', 'participates.author_id')
            ->join('books', 'books.id', '=', 'participates.book_id')
            ->where('participates.book_id', $id)
            ->select('author_name')
            ->get();
        foreach ($authors as $author) {
            $book->author_name[] = $author->author_name;
        }
        // ảnh sách
        $images = DB::table('list_images')
            ->join('books', 'books.id', '=', 'list_images.book_id')
            ->select('list_images.image')
            ->where('books.id', $id)
            ->get();
        // tổng số lượng đã bán của sách
        // $book->total_sell = DB::table('orders')
        //     ->join('order_details', 'order_details.order_id', '=', 'orders.id')
        //     ->where('order_details.book_id', $book->id)->where('orders.status', 1)->sum('order_details.quantity');
        // đánh giá sách
        $reviews = DB::table('reviews')
            ->join('users', 'users.id', '=', 'reviews.user_id')
            ->join('books', 'books.id', '=', 'reviews.book_id')
            ->where('reviews.book_id', $id)
            ->select('users.name as user_name', 'users.image', 'reviews.id', 'reviews.rating', 'reviews.comment', 'reviews.created_at')
            ->get();
        //tổng số đánh giá
        $book->total_reviews = $reviews->count();
        //đánh giá trung bình
        $book->avg_rating = $reviews->avg('rating');

        // Sản phẩm tương tự 
        $similar_books = DB::table('books')
            ->leftJoin('reviews', 'reviews.book_id', '=', 'books.id')
            ->whereNull('books.deleted_at')
            ->where('cate_id', $book->cate_id)
            ->where('books.id', '!=', $book->id)
            ->select(
                'books.id',
                'books.book_title',
                'books.price',
                'books.promotion_price',
                'books.quantity',
                'books.image',
                DB::raw('avg(reviews.rating) as avg_rating'),
                DB::raw('count(reviews.id) as total_reviews'),
                DB::raw('case when books.promotion_price = 0 then 0 else (books.price - books.promotion_price) * 100 / books.price end as discount_rate')
            )
            ->groupBy('books.id', 'books.book_title', 'books.price', 'books.promotion_price', 'books.quantity', 'books.image')
            ->orderBy('books.id', 'desc')
            ->get();
        return view('clients.product_detail', compact(['book', 'images', 'reviews', 'similar_books']));
    }

    public function check($id)
    {
        $c_id = DB::table('categories')
            ->where('cate_id', $id)
            ->get();
        $a = [];
        foreach ($c_id as $c) {
            $a[] = $c->id;
        }
        return $a;
    }

    // Hàm đệ quy để lấy các danh mục cha
    public function get_parent_categories($category, &$parents = array())
    {
        // Nếu danh mục có danh mục cha
        if ($category->parent) {
            // Thêm danh mục cha vào đầu mảng
            array_unshift($parents, $category->parent);
            // Gọi lại hàm đệ quy với danh mục cha
            $this->get_parent_categories($category->parent, $parents);
        }
        // Trả về mảng các danh mục cha
        return $parents;
    }
    // Trang sản phẩm
    public function product_book(Request $request)
    {
        $query = Book::query();
        if (isset($request->id) && $request->id != '') {
            $id = $request->id;
        }

        if (!isset($request->id) || $request->id == '') {
            $current_category = null;
            $parent_categories = [];
        } else {
            $c_id = [$id];
            $i = 0;
            while ($i < count($c_id)) {
                $sub_cate_id = $this->check($c_id[$i]);
                if ($sub_cate_id) {
                    $c_id = array_merge($c_id, $sub_cate_id);
                }
                $i++;
            }
            $current_category = Category::find($id);
            if ($current_category) {
                $parent_category = $current_category->parent;
                $parent_categories = $this->get_parent_categories($current_category);
            } else {
                $parent_category = null;
            }
        }
        // set lọc theo giá + danh mục
        $kt = false;
        $d = 0;
        foreach ($_GET as $key => $value) {
            if (strpos($key, "price") !== false) {
                $d++;
            }
        }
        foreach ($_GET as $key => $value) {
            if (strpos($key, "price") !== false) {
                if ($d == 1) {
                    if ($value != '>700.000') {
                        // Chuyển đổi chuỗi thành số và loại bỏ dấu chấm
                        list($min, $max) = explode("-", str_replace('.', '', $value));
                        $query->where(function ($query) use ($min, $max) {
                            $query->where(function ($query) use ($min, $max) {
                                $query->where('promotion_price', '>', 0)
                                    ->whereBetween('promotion_price', [(int)$min, (int)$max]);
                            })->orWhere(function ($query) use ($min, $max) {
                                $query->where('promotion_price', '=', 0)
                                    ->whereBetween('price', [(int)$min, (int)$max]);
                            });
                        });
                        $kt = true;
                        $d++;
                    } else {
                        $query->where(function ($query) {
                            $query->where(function ($query) {
                                $query->where('promotion_price', '>', 0)
                                    ->where('promotion_price', '>=', 700000);
                            })->orWhere(function ($query) {
                                $query->where('promotion_price', '=', 0)
                                    ->where('price', '>=', 700000);
                            });
                        });
                        $kt = true;
                        $d++;
                    }
                } else {
                    if ($value != '>700.000') {
                        // Chuyển đổi chuỗi thành số và loại bỏ dấu chấm
                        list($min, $max) = explode("-", str_replace('.', '', $value));
                        $query->orWhere(function ($query) use ($min, $max) {
                            $query->where(function ($query) use ($min, $max) {
                                $query->where('promotion_price', '>', 0)
                                    ->whereBetween('promotion_price', [(int)$min, (int)$max]);
                            })->orWhere(function ($query) use ($min, $max) {
                                $query->where('promotion_price', '=', 0)
                                    ->whereBetween('price', [(int)$min, (int)$max]);
                            });
                        });
                        $kt = true;
                        $d++;
                    } else {
                        $query->orWhere(function ($query) {
                            $query->where(function ($query) {
                                $query->where('promotion_price', '>', 0)
                                    ->where('promotion_price', '>=', 700000);
                            })->orWhere(function ($query) {
                                $query->where('promotion_price', '=', 0)
                                    ->where('price', '>=', 700000);
                            });
                        });
                        $kt = true;
                        $d++;
                    }
                }
            }

            if (isset($c_id)) {
                $query->where(function ($query) use ($c_id) {
                    $query->whereIn('cate_id', $c_id);
                });
            }

            // set query cho lọc theo đánh giá
            if (isset($_GET['star'])) {
                $rate = $_GET['star'];
                $query->whereHas('reviews', function ($query) use ($rate) {
                    $query->selectRaw('avg(rating) as average_rating') //tính giá trị trung bình rating của các reviews liên quan
                        ->groupBy('book_id') //nhóm theo product_id
                        ->havingRaw('average_rating >=' . $rate); //lọc ra những sản phẩm có giá trị trung bình rating lớn hơn 4
                });
            }
            if (isset($request->search) && $request->search != '') {
                // lưu dữ liệu từ form trên vào biến session
                if (strpos($request->url(), 'search_book') !== false) {
                    session(['search' => $request->search]);
                    $search = $request->search;
                    $query->where(function ($query) use ($search) {
                        $query->where('book_title', 'like', '%' . $search . '%');
                        $query->orWhereHas('authors', function ($query) use ($search) {
                            $query->where('author_name', 'like', '%' . $search . '%');
                        });
                    });
                } else {
                    session(['search' => '']);
                }
            }
        }
        // nếu lọc theo danh mục sách mà không lọc theo giá
        if ($kt == false && isset($c_id)) {
            $query->where(function ($query) use ($c_id) {
                $query->whereIn('cate_id', $c_id);
            });
            if (isset($_GET['star'])) {
                $rate = $_GET['star'];
                $query->whereHas('reviews', function ($query) use ($rate) {
                    $query->selectRaw('avg(rating) as average_rating') //tính giá trị trung bình rating của các reviews liên quan
                        ->groupBy('book_id') //nhóm theo product_id
                        ->havingRaw('average_rating >=' . $rate); //lọc ra những sản phẩm có giá trị trung bình rating lớn hơn 4
                });
            }
        }
        $books = $query->leftJoin('reviews', 'reviews.book_id', '=', 'books.id')
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
            ->orderBy('books.id', 'desc')
            ->paginate(12);
        return view('clients.product_book', compact(['books', 'parent_categories', 'current_category']));
    }

    // Đơn hàng của tôi
    public function my_order()
    {
        $orders = DB::table('orders')
            ->join('users', 'users.id', '=', 'orders.user_id')
            ->orderBy('orders.created_at', 'desc')
            ->select('users.name', 'users.image', 'orders.*')
            ->where('user_id', Auth::user()->id)
            ->paginate(10);
        return view('clients.my_order', compact(['orders']));
    }

    public function my_order_detail($id)
    {
        $order = DB::table('orders')
            ->join('users', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'order_details.id', '=', 'orders.id')
            ->orderBy('orders.created_at', 'desc')
            ->where('orders.id', $id)
            ->select('users.name', 'users.image', 'orders.*')
            ->first();
        $discount_percent = DB::table('promotions')->where('discount_code', 'like', $order->discount_code)->first();

        $order->discount_percent = $discount_percent->discount_percent ?? '';
        $order_details = DB::table('order_details')
            ->join('books', 'books.id', '=', 'order_details.book_id')
            ->where('order_id', $id)
            ->select('books.book_title', 'books.image', 'order_details.*')
            ->get();
        $money = 0;
        foreach ($order_details as $order_detail) {
            $money += $order_detail->quantity * $order_detail->price;
        }
        $order->money = $money;
        // giao hàng dự kiến
        $order->dt = new Carbon($order->created_at);
        $order->dt->addDays(4);
        return view('clients.my_order_detail', compact('order', 'order_details'));
    }

    public function cancel_order($id)
    {
        $cancel_order = Order::where('id', $id)->update(['status' => 2, 'delivery' => 4]);
        if ($cancel_order) {
            Session::flash('success', 'Bạn đã hủy đơn hàng ' . $id . ' thành công');
        }
        return redirect()->back();
    }

    public function info()
    {

        return view('clients.info');
    }
    public function term_of_use()
    {

        return view('clients.terms_of_use');
    }
}
