<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PromotionController;
use App\Http\Controllers\PublisherController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home');
//trang sản phẩm
Route::get('/product/{id}', [HomeController::class, 'product_book'])->name('product');
Route::get('/product', [HomeController::class, 'product_book'])->name('product');
Route::get('/search_book', [HomeController::class, 'product_book'])->name('search_book');

// chi tiết sản phẩm
Route::get('/product_detail/{id}', [HomeController::class, 'product_detail'])->name('product_detail');

// bình luận
Route::match(['get', 'post'], '/rating_review', [ReviewController::class, 'store'])->name('rating_review')->middleware('auth');

Route::prefix('admin')->middleware('checkrole')->group(function () {
    Route::get('/', [CategoryController::class, 'index'])->name('admin');
    //user
    Route::get('/users', [UserController::class, 'index'])->name('users');
    Route::match(['GET', 'POST'], '/add/user', [UserController::class, 'store'])->name('add_user');
    Route::match(['GET', 'POST'], '/edit/user/{id}', [UserController::class, 'update'])->name('edit_user');
    Route::get('/delete/user/{id}', [UserController::class, 'destroy'])->name('delete_user');

    //category
    Route::get('/categories', [CategoryController::class, 'index'])->name('categories');
    Route::match(['GET', 'POST'], '/add/category', [CategoryController::class, 'store'])->name('add_category');
    Route::match(['GET', 'POST'], '/edit/category/{id}', [CategoryController::class, 'update'])->name('edit_category');
    Route::get('/delete/category/{id}', [CategoryController::class, 'destroy'])->name('delete_category');

    //publisher
    Route::get('/publishers', [PublisherController::class, 'index'])->name('publishers');
    Route::match(['GET', 'POST'], '/add/publisher', [PublisherController::class, 'store'])->name('add_publisher');
    Route::match(['GET', 'POST'], '/edit/publisher/{id}', [PublisherController::class, 'update'])->name('edit_publisher');
    Route::get('/delete/publisher/{id}', [PublisherController::class, 'destroy'])->name('delete_publisher');

    //author
    Route::get('/authors', [AuthorController::class, 'index'])->name('authors');
    Route::match(['GET', 'POST'], '/add/author', [AuthorController::class, 'store'])->name('add_author');
    Route::match(['GET', 'POST'], '/edit/author/{id}', [AuthorController::class, 'update'])->name('edit_author');
    Route::get('/delete/author/{id}', [AuthorController::class, 'destroy'])->name('delete_author');


    //Books
    Route::get('/books', [BookController::class, 'index'])->name('books');
    Route::match(['GET', 'POST'], '/add/book', [BookController::class, 'store'])->name('add_book');
    Route::match(['GET', 'POST'], '/edit/book/{id}', [BookController::class, 'update'])->name('edit_book');
    Route::get('/delete/image/{id}', [BookController::class, 'delete_image'])->name('delete_image');
    Route::get('/delete/book/{id}', [BookController::class, 'destroy'])->name('delete_book');

    // Promotions
    Route::get('/promotions', [PromotionController::class, 'index'])->name('promotions');
    Route::match(['GET', 'POST'], '/add/promotion', [PromotionController::class, 'store'])->name('add_promotion');
    Route::match(['GET', 'POST'], '/edit/promotion/{id}', [PromotionController::class, 'update'])->name('edit_promotion');
    Route::get('/delete/promotion/{id}', [PromotionController::class, 'destroy'])->name('delete_promotion');

    // Orders
    Route::get('/orders', [OrderController::class, 'list'])->name('orders');
    Route::post('/update_order_status', [OrderController::class, 'update_order_status'])->name('update_order_status');
    Route::get('/delete_order/{id}', [OrderController::class, 'destroy'])->name('delete_order');
    Route::get('/order_detail/{id}', [OrderController::class, 'order_detail'])->name('order_detail');

    // Reviews
    Route::get('/reviews', [ReviewController::class, 'list'])->name('reviews');
        //Lấy ra đánh giá theo sách
    Route::get('/book_review_detail/{id}',[ReviewController::class,'book_review_detail'])->name('book_review_detail');
    Route::get('/delete_review/{id}',[ReviewController::class, 'delete_review'])->name('delete_review');
    Route::get('/delete_book_review/{id}', [ReviewController::class, 'delete_book_review'])->name('delete_book_review');
});

// Đăng ký đăng nhập
Route::match(['GET', 'POST'], '/register', [AuthController::class, 'register'])->name('register');
Route::match(['GET', 'POST'], '/login', [AuthController::class, 'login'])->name('login');
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
Route::get('/profile', [AuthController::class, 'profile'])->name('profile')->middleware('auth');
Route::match(['GET', 'POST'], '/update_avatar', [AuthController::class, 'update_Avatar'])->name('update_avatar')->middleware('auth');
Route::match(['GET', 'POST'], '/doimk', [AuthController::class, 'update_Password'])->name('doimk')->middleware('auth');
Route::match(['GET', 'POST'], '/update_profile', [AuthController::class, 'update_Profile'])->name('update_profile')->middleware('auth');


// cart
Route::match(['GET', 'POST'], '/add_to_cart/{id}', [CartController::class, 'add_to_cart'])->name('add_to_cart')->middleware('auth');
Route::get('/cart', [CartController::class, 'index'])->name('cart')->middleware('auth');
// route::post('/update_quantity/{id}', [CartController::class, 'update_quantity'])->name('update_quantity')->middleware('auth');

Route::get('/descrease_quantity/{id}', [CartController::class, 'descrease_quantity'])->name('descrease_quantity')->middleware('auth');
Route::get('/increase_quantity/{id}', [CartController::class, 'increase_quantity'])->name('increase_quantity')->middleware('auth');
Route::get('/delete_book_cart/{id}', [CartController::class, 'delete_book_cart'])->name('delete_book_cart')->middleware('auth');

Route::match(['GET', 'POST'], '/payment_page', [CartController::class, 'payment_page'])->name('payment_page')->middleware('auth');

// thanh toán
Route::match(['GET', 'POST'], '/checkout', [CheckoutController::class, 'checkout'])->name('checkout')->middleware('auth');
Route::get('/payment_check', [checkoutController::class, 'payment_check'])->name('payment_check')->middleware('auth');

// xem đơn hàng
Route::get('/my_order',[HomeController::class, 'my_order'])->name('my_order')->middleware('auth');
Route::get('/my_order_detail/{id}',[HomeController::class, 'my_order_detail'])->name('my_order_detail')->middleware('auth');
Route::get('/cancel_order/{id}',[HomeController::class, 'cancel_order'])->name('cancel_order')->middleware('auth');

// một số trang
Route::get('/info', [HomeController::class, 'info'])->name('info');
Route::get('/term_of_use', [HomeController::class, 'term_of_use'])->name('term_of_use');
