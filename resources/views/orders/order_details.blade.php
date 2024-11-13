@extends('templates.layout_admin')
@section('content')
    <div class="order_detail">
        <table class="table">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Recipient Name</th>
                    <th>Recipient Phone Number</th>
                    <th>Delivery Address</th>
                    <th>Order Date</th>
                    <th>Delivery Date</th>
                    <th>Status</th>
                    <th>Delivery</th>
                </tr>   
            </thead>
            <tbody>
                <tr>
                    <td>
                        <img style="width: 50px; height: 50px !important ; border-radius: 50%" src="{{ Storage::url($order->image) }}">
                        <p class="my-auto" style="margin-left: 5px;">{{ $order->name }}</p>
                    </td>  
                    <td>{{ $order->recipient_name }}</td>
                    <td>{{ $order->recipient_phone_number }}</td>
                    <td>{{ $order->delivery_address }}</td>
                    <td>{{ (new DateTime($order->created_at))->format('d-m-Y H:i:s') }}</td>
                    <td>
                        @if ($order->delivery == 3)
                            {{ (new DateTime($order->updated_at))->format('d-m-Y H:i:s') }}
                        @elseif($order->delivery == 4)
                            Đơn hàng đã bị hủy
                        @else 
                            Dự Kiến {{ (new DateTime($order->dt))->format('d-m-Y') }}
                        @endif
                    </td>
                    <td>
                        @if ($order->status == 0)
                            <span style="font-size: 10px;padding: 6px 16px;color: var(--light);border-radius: 20px;
                            font-weight: 700; background:#FBC02D">Chưa thanh toán</span>
                        @elseif ($order->status == 1)
                            <span style="font-size: 10px;padding: 6px 16px;color: var(--light);border-radius: 20px;
                            font-weight: 700; background:#388E3C">Đã thanh toán</span>
                        @else 
                        <span style="font-size: 10px;padding: 6px 16px;color: var(--light);border-radius: 20px;
                        font-weight: 700; background:#D32F2F">Đã hủy đơn</span>
                        @endif
                    </td> 
                    <td>
                        <form action="{{ route('update_order_status') }}" method="post">
                            @csrf
                            <input type="hidden" value="{{ $order->id }}" name="id">
                            <select class="form-select" name="delivery" aria-label="Default select example" onchange='if (this.value != 0) { this.form.submit (); }'>
                                <option value="0" {{ $order->delivery == 0 ? 'selected' : '' }}>Đang chờ xác nhận</option>
                                <option value="1" {{ $order->delivery == 1 ? 'selected' : '' }}>Đã xác nhận</option>
                                <option value="2" {{ $order->delivery == 2 ? 'selected' : '' }}>Đang giao hàng</option>
                                <option value="3" {{ $order->delivery == 3 ? 'selected' : '' }}>Đã giao hàng</option>
                                <option value="4" {{ $order->delivery == 4 ? 'selected' : '' }}>Đơn hàng bị hủy </option>
                            </select>
                            @if (Session::has('success_update_status'.$order->id))
                                <strong style="color: green">{{ Session::get('success_update_status'.$order->id) }}</strong> <br>
                            @endif
                        </form>
                    </td>
                </tr>
            </tbody>          
        </table>
        <table class="table table-striped table">
            <thead>
                {{-- sản phẩm --}}
                <tr>
                    <th>Book Title</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>   
            <tbody>
                @foreach ($order_details as $o)
                    <tr>
                        <td>{{ $o->book_title }}</td>
                        <td><img style="height: 150px; width: 150px; border-radius: 30px" src="{{ Storage::url($o->image) }}" alt=""></td>
                        <td>{{ $o->quantity }}</td>
                        <td>{{number_format($o->quantity * $o->price, 0, '', ',')  }}đ</td>
                    </tr>                    
                @endforeach
                <tr>
                    <td colspan="3">Tổng Tiền = </td>
                    <td>{{number_format($order->total_money, 0, '', ',')  }}đ</td>
                </tr>              
            </tbody>
        </table>
        <a href="{{ route('delete_order',['id' => $order->id]) }}" onclick="return confirm('Do you want to delete this order?')" 
            class="btn btn-outline-danger {{ ($order->delivery != 3 && $order->delivery != 4) ? 'disabled' : '' }}">Delete Order</a>    
        <a href="{{ route('orders') }}" class="btn btn-outline-primary">List Orders</a>
    </div>
@endsection