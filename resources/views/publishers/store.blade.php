@extends('templates.layout_admin')
@section('content')
<div class="action">
    @if (Session::has('success'))
        <strong style="color: green">{{ Session::get('success') }}</strong>
    @endif
    <form action="{{ route('add_publisher') }}" method="post" enctype="multipart/form-data">
        @csrf
        <h1 style="text-align: center">{{ $title }}</h1>
            <div class="col-lg-6 col-sm-12 mx-auto">
                <label for="" class="form-label">Publisher Name</label>
                <input type="text" name="publisher_name" class="form-control">
                <span class="@error('publisher_name') is-valid  @enderror" style="color: red" >{{ $errors->first('publisher_name') }}</span>
            </div>
        <div class="gap-2 col-2  mx-auto">
            <button class="btn btn-primary ">Save</button>
            <a href="{{ route('publishers') }}" class="btn btn-primary">List Publisher</a>
        </div>
    </form>
</div>
  
@endsection