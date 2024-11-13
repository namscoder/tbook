@extends('templates.layout')
@section('content')
    <div class="my_order container">
        <h1 style="text-align: center; margin-bottom: 15px;">Chi tiết đơn hàng {{ $order->id }}</h1>
        @if (Session::has('success'))
            <strong style="color: green">{{ Session::get('success') }}</strong> <br>
        @endif
        <span>Thông tin khách hàng</span>
        <table class="table table-bordered table-striped" style="text-align: center;">
            <thead>
                <tr>
                    <th>Người đặt</th>
                    <th>Người nhận</th>
                    <th>SĐT người nhận</th>
                    <th>Địa chỉ</th>
                </tr>
            </thead>
            <tbody>
                <td>
                    <img style="width: 50px; height: 50px !important ; border-radius: 50%" src="{{ Storage::url($order->image) }}">
                    <p class="my-auto" style="margin-left: 5px;">{{ $order->name }}</p>
                </td>  
                <td>{{ $order->recipient_name }}</td>
                <td>{{ $order->recipient_phone_number }}</td>
                <td>{{ $order->delivery_address }}</td>
            </tbody>
        </table>
        <span> Trạng thái đơn hàng</span>
        <table class="table table-bordered " style="text-align: center;">
            <thead>
                <tr>  
                    <th>Mã giảm giá</th>
                    <th>Ngày đặt</th>
                    <th>Thời gian giao hàng</th>
                    <th>Hình thức thanh toán</th>
                    <th>Thanh toán</th>
                    <th>Trạng thái đơn hàng</th>
                </tr>   
            </thead>
            <tbody>
                <tr>
                    <td>
                        @if ($order->discount_code)
                            {{ $order->discount_code }} (giảm {{ $order->discount_percent }}%)
                        @else 
                            <span>Không có</span>
                        @endif
                    </td>
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
                    <td>{{ $order->payment_method == 0 ? "Thanh toán khi nhận hàng" : "VNPay" }}</td>
                    <td>
                        @if ($order->status == 0)
                            <span>Chưa thanh toán</span>
                        @elseif ($order->status == 1)
                            <span>Đã thanh toán</span>
                        @else 
                        <span >Đã hủy đơn</span>
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
                </tr>
            </tbody>          
        </table>

        <span>Sản phẩm</span>
        <table class="table table-striped table-bordered ">
            <thead>
                {{-- sản phẩm --}}
                <tr>
                    <th>Sách</th>
                    <th>Ảnh</th>
                    <th>Số Lượng</th>
                    <th>Đơn giá</th>
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
                    <td>
                        @if ($order->discount_code)
                            {{ number_format($order->money, 0, '', ',')   }} * {{ 100 - $order->discount_percent }}% = 
                            {{number_format($order->total_money, 0, '', ',') }}đ 
                            (giảm {{number_format($order->money - $order->total_money, 0, '', ',')  }}đ)
                        @else
                            {{ number_format($order->total_money, 0, '', ',')   }}đ
                        @endif
                        
                    </td>
                </tr>              
            </tbody>
        </table>
        <a href="{{ route('my_order') }}" class="btn btn-outline-primary">Đơn hàng của tôi</a>        
        <a href="{{ route('cancel_order',['id' => $order->id]) }}" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng?')" 
            class="btn btn-outline-danger {{ ($order->delivery == 3 || $order->delivery == 4) ? 'disabled' : '' }}">Hủy đơn</a>  
    </div>
@endsection