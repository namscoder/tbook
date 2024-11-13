<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Order_Detail;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    //
    public function list()
    {
        $orders = DB::table('orders')
            ->join('users', 'users.id', '=', 'orders.user_id')
            ->orderBy('orders.created_at', 'desc')
            ->select('users.name', 'users.image', 'orders.*')
            ->whereNull('orders.deleted_at')
            ->paginate(10);
        return view('orders.list', compact('orders'));
    }
    public function update_order_status(Request $request)
    {
        $id = $request->id;
        $order = Order::find($id);
        $status_update = DB::table('orders')->where('id', $id)->update(['delivery' => $request->delivery]);
        if ($request->delivery == 3) {
            $status_update = DB::table('orders')->where('id', $id)->update(['status' => 1]);
        } elseif ($request->delivery == 4) {
            $status_update = DB::table('orders')->where('id', $id)->update(['status' => 2]);
        }
        if ($status_update) {
            Session::flash('success_update_status' . $id, 'Update successful delivery status');
        }
        $order->touch();
        return redirect()->back();
    }

    public function order_detail($id)
    {
        $order = DB::table('orders')
            ->join('users', 'users.id', '=', 'orders.user_id')
            ->join('order_details', 'order_details.id', '=', 'orders.id')
            ->orderBy('orders.created_at', 'desc')
            ->where('orders.id', $id)
            ->select('users.name', 'users.image', 'orders.*')
            ->first();
        $order_details = DB::table('order_details')
            ->join('books', 'books.id', '=', 'order_details.book_id')
            ->where('order_id', $id)
            ->select('books.book_title', 'books.image', 'order_details.*')
            ->get();
        
        // giao hàng dự kiến
        $order->dt = new Carbon($order->created_at); 
        $order->dt->addDays(4);
        return view('orders.order_details', compact('order', 'order_details'));
    }

    public function destroy($id){
        $order_DL = Order::where('id', $id)->delete();
        $order_details_DL=Order_Detail::where('order_id', $id)->delete();
        if($order_DL && $order_details_DL){
            Session::flash('success','Delete Order Successfully');
        }
        return redirect()->back();
    }
}
