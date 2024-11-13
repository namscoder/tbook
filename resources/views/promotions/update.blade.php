@extends('templates.layout_admin')
@section('content')
<div class="action">
    @if (Session::has('success'))
        <strong style="color: green">{{ Session::get('success') }}</strong>
    @endif
    <form action="{{ route('edit_promotion',['id'=>$promotion->id]) }}" method="post" enctype="multipart/form-data">
        @csrf
        <h1 style="text-align: center">{{ $title }}</h1>
        <div class="col-lg-12 col-sm-12">
            <label for="" class="form-label">Discount Code</label>
            <input type="text" name="discount_code" class="form-control" value="{{ $promotion->discount_code }}">
            <span class="@error('discount_code') is-valid  @enderror" style="color: red" >{{ $errors->first('discount_code') }}</span>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <label for="" class="form-label">Event</label>
                <input type="text" name="event" class="form-control" value="{{ $promotion->event }}">
                <span class="@error('event') is-valid  @enderror" style="color: red" >{{ $errors->first('event') }}</span>
            </div>
           
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <label for="" class="form-label">Discount Percent</label>
                <input type="text" name="discount_percent" class="form-control" value="{{ $promotion->discount_percent }}">
                <span class="@error('discount_percent') is-valid  @enderror" style="color: red" >{{ $errors->first('discount_percent') }}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-12">
                <label for="" class="form-label">Start</label>
                <input type="date" name="start" class="form-control" value="{{ $promotion->start }}">
                <span class="@error('start') is-valid  @enderror" style="color: red" >{{ $errors->first('start') }}</span>
            </div>
            <div class="col-lg-6 col-sm-12">
                <label for="" class="form-label">End</label>
                <input type="date" name="end" class="form-control" value="{{ $promotion->end }}">
                <span class="@error('end') is-valid  @enderror" style="color: red" >{{ $errors->first('end') }}</span>
            </div>
        </div>  
        <div class="gap-2 col-3 mx-auto" style="text-align: center; margin-top: 40px !important;">
            <button class="btn btn-primary ">Save</button>
            <a href="{{ route('promotions') }}" class="btn btn-primary">List Promotion</a>
        </div>
    </form>
</div>
  
@endsection