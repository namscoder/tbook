@extends('templates.layout')
@section('content')
    <div class="my_order container">
        @if ($orders)
            <h1>Đơn hàng của bạn</h1>
            @if (Session::has('success'))
                <strong style="color: green">{{ Session::get('success') }}</strong> <br>
            @endif
            <table class="table" style="text-align: center">
                <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Người nhận</th>
                        <th>Tổng tiền</th>
                        {{-- <th>Ngày đặt</th> --}}
                        <th>Hình thức thanh toán</th>
                        <th>Thanh toán</th>
                        <th>Trạng thái đơn hàng</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($orders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>  
                            <td>{{ $order->recipient_name }}</td>   
                            <td>{{number_format($order->total_money + $order->transport_fee, 0, '', ',')  }}đ</td>
                            {{-- <td>{{ (new DateTime($order->created_at))->format('d-m-Y') }}</td> --}}
                            <td>{{ $order->payment_method == 0 ? "Thanh toán khi nhận hàng" : "VnPay" }}</td>
                            <td>
                                @if ($order->status == 0)
                                    <span >Chưa thanh toán</span>
                                @elseif ($order->status == 1)
                                    <span>Đã thanh toán</span>
                                @else 
                                    <span>Đã hủy đơn</span>
                                @endif
                            </td> 
                            <td>
                                @if ($order->delivery == 0)
                                    <span >Đang chờ xác nhận</span>
                                @elseif ($order->delivery == 1)
                                    <span>Đã xác nhận</span>
                                @elseif ($order->delivery == 2)
                                    <span>Đang giao hàng</span>
                                @elseif ($order->delivery == 3)
                                    <span>Đã giao hàng</span>
                                @else 
                                    <span>Đã hủy đơn</span>
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('my_order_detail',['id' => $order->id]) }}" class="btn btn-outline-primary">Chi tiết đơn hàng</a> <br>          
                                <a href="{{ route('cancel_order',['id' => $order->id]) }}" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng?')" 
                                    class="btn btn-outline-danger {{ ($order->delivery == 3 || $order->delivery == 4) ? 'disabled' : '' }}">Hủy đơn</a>    
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <span>Bạn không có đơn hàng nào.</span>
        @endif
    </div>
@endsection