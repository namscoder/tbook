@extends('templates.layout_admin')
@section('content')
<div class="action">
    @if (Session::has('success'))
        <strong style="color: green">{{ Session::get('success') }}</strong>
    @endif
    <form action="{{ route('edit_author',['id'=>$author->id]) }}" method="post" enctype="multipart/form-data">
        @csrf
        <h1 style="text-align: center">{{ $title }}</h1>
            <div class="col-lg-6 col-sm-12 mx-auto">
                <label for="" class="form-label">Author Name</label>
                <input type="text" name="author_name" class="form-control" value="{{ $author->author_name }}">
                <span class="@error('author_name') is-valid  @enderror" style="color: red" >{{ $errors->first('author_name') }}</span>
            </div>
            <div class="mb-3 col-lg-6 col-sm-12 mx-auto">
                <label for="" class="form-label">Gender</label>
                <div style="margin-left: 30px;">
                    <div class="form-check">
                        <input class="form-check-input"  type="radio" name="gender" value="1" id="gioitinh1" {{ $author->gender == 1 ? "checked":"" }}>
                        <label class="form-check-label" for="gioitinh1">
                          Nam
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="0" id="gioitinh2" {{ $author->gender == 0 ? "checked":"" }}>
                        <label class="form-check-label" for="gioitinh2">
                          Nữ
                        </label>
                    </div>
                </div>
                <span class="@error('gender') is-valid  @enderror" style="color: red" >{{ $errors->first('gender') }}</span>
            </div>
        <div class="gap-2 col-2  mx-auto">
            <button class="btn btn-primary ">Save</button>
            <a href="{{ route('authors') }}" class="btn btn-primary">List Author</a>
        </div>
    </form>
</div>
  
@endsection