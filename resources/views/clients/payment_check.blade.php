@extends('templates.layout')
@section('content')
    <div class="container confirm">
        
        @if(isset($message))
            <span style="color:green">{{ $message }}</span> 
            <h3 style="margin-top: 20px">Cảm ơn bạn đã mua hàng của chúng tôi. Chúc bạn một ngày tốt lành và làm việc hiệu quả.</h3>
            <p>Mã đơn hàng của bạn là {{ $orders->id }}. Kiểm tra tình trạng đơn hàng của bạn tại <a href="{{ route('my_order') }}">Đơn hàng của tôi.</a></p>
            <img class="img-fluid" src="{{ asset('images/thanks.jpg') }}" alt="">
        @else
            @if ($returnData['RspCode'] == '00' || $returnData['RspCode'] == '02')
                <span style="color:green">{{ $returnData['Message'] }}</span> 
                <h3 style="margin-top: 20px">Cảm ơn bạn đã mua hàng của chúng tôi. Chúc bạn một ngày tốt lành và làm việc hiệu quả.</h3>
                <p>Mã đơn hàng của bạn là {{ $orderId }}. Kiểm tra tình trạng đơn hàng của bạn tại <a href="{{ route('my_order') }}">Đơn hàng của tôi.</a></p>
                <img class="img-fluid" src="{{ asset('images/thanks.jpg') }}" alt="">
            @else
                <img  class="img-fluid" style="max-width: 150px;height: 150px;" src="{{ asset('images/error.png') }}" alt=""><br>
                <span style="color:red" >{{ $returnData['Message'] }}</span> <br>
                <a style="margin-top: 50px; font-size: 25px" href="{{ route('home') }}" class="btn btn-primary">Trở về trang chủ</a>
            @endif
        @endif
    </div>
@endsection