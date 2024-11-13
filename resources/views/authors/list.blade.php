@extends('templates.layout_admin')
@section('content')
<div class="content_admin">
    @if (Session::has('success'))
        <strong style="color: green">{{ Session::get('success') }}</strong> <br>
    @endif
    <a href="{{ route('add_author') }}" class="btn btn-outline-primary">Add Author</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Author Name</th>
                <th>Gender</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($authors as $author)
                <tr>
                    <td>{{ $author->id }}</td>
                    <td>{{ $author->author_name }}</td>
                    <td>{{ $author->gender == 0 ? "Nữ":"Nam" }}</td>
                    <td>
                        <a class="btn btn-outline-warning" href="{{ route('edit_author',['id'=>$author->id]) }}">Edit</a>
                        <a class="btn btn-outline-danger" onclick="return confirm('Do you want to delete this author?')" href="{{ route('delete_author',['id'=>$author->id]) }}">Delete</a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    {{ $authors->links() }}
</div>

@endsection