@extends('templates.layout_admin')
@section('content')
    <div class="content_admin">
        @if (Session::has('success'))
            <strong style="color: green">{{ Session::get('success') }}</strong> <br>
        @endif
        <table class="table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Recipient Name</th>
                    <th>Total Money</th>
                    <th>Discount Code</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Delivery</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $order)
                    <tr>
                        <td>{{ $order->id }}</td>
                        <td>
                            <img style="width: 50px; height: 50px !important ; border-radius: 50%" src="{{ Storage::url($order->image) }}">
                            <p class="my-auto" style="margin-left: 5px;">{{ $order->name }}</p>
                        </td>   
                        <td>{{ $order->recipient_name }}</td>   
                        <td>{{number_format($order->total_money + $order->transport_fee, 0, '', ',')  }}đ</td>
                        <td>{{ $order->discount_code != '' ? $order->discount_code : 'Không có' }}</td>
                        <td>{{ (new DateTime($order->created_at))->format('d-m-Y') }}</td>
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
                        <td>
                            <a href="{{ route('order_detail',['id' => $order->id]) }}" class="btn btn-outline-primary">Order Details</a>           
                            <a href="{{ route('delete_order',['id' => $order->id]) }}" onclick="return confirm('Do you want to delete this order?')" 
                                class="btn btn-outline-danger {{ ($order->delivery != 3 && $order->delivery != 4) ? 'disabled' : '' }}">Delete Order</a>    
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        {{ $orders->links() }}
    </div>
@endsection