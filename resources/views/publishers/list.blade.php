@extends('templates.layout_admin')
@section('content')
    <div class="content_admin">
        @if (Session::has('success'))
            <strong style="color: green">{{ Session::get('success') }}</strong> <br>
        @endif
        <a href="{{ route('add_publisher') }}" class="btn btn-outline-primary">Add Publisher</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Publisher Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($publishers as $publisher)
                    <tr>
                        <td>{{ $publisher->id }}</td>
                        <td>{{ $publisher->publisher_name }}</td>
                        <td>
                            <a class="btn btn-outline-warning" href="{{ route('edit_publisher',['id'=>$publisher->id]) }}">Edit</a>
                            <a class="btn btn-outline-danger" onclick="return confirm('Do you want to delete this publisher?')" href="{{ route('delete_publisher',['id'=>$publisher->id]) }}">Delete</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        {{ $publishers->links() }}
    </div>
@endsection