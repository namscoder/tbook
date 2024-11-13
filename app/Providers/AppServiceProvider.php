<?php

namespace App\Providers;

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\HomeController;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */

    public function categories($id)
    {
        $categories = DB::table("categories")->where("id", '=', $id)->get();
        return $categories;
    }
    public function boot(): void
    {
        Schema::defaultStringLength(191); //add
        Paginator::useBootstrap();

        View::composer(['clients.*'], function ($view) {
            $categories = Category::all();
            //tổng sản phẩm trong giỏ hàng
            if (Auth::user()) {
                $total_product_cart = DB::table('carts')->whereNull('carts.deleted_at')->where('user_id', Auth::user()->id)->sum('quantity');
                $view->with('total_product_cart', $total_product_cart);
            }

            $view->with('categories', $categories);
        });
    }
}
