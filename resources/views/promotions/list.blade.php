@extends('templates.layout_admin')
@section('content')
    <div class="content_admin">
        @if (Session::has('success'))
            <strong style="color: green">{{ Session::get('success') }}</strong> <br>
        @endif
        <a href="{{ route('add_promotion') }}" class="btn btn-outline-primary">Add Promotion</a>
        <table class="table">
            <thead>
                <tr>
                    <th>Discount Code</th>
                    <th>Event</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Discount Percent</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($promotions as $promotion)
                    <tr>
                        <td>{{ $promotion->discount_code }}</td>
                        <td>{{ $promotion->event }}</td>
                        <td>{{ $promotion->start }}</td>
                        <td>{{ $promotion->end }}</td>
                        <td>{{ $promotion->discount_percent }}</td>
                        <td>
                            <a href="{{ route('edit_promotion',['id'=>$promotion->id]) }}" class="btn btn-outline-warning">Edit</a>
                            <a href="{{ Route('delete_promotion',['id'=>$promotion->id]) }}" onclick="return confirm('Do you want delete this promotion?')" class="btn btn-outline-danger">Delete</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        {{ $promotions->links() }}
    </div>

@endsection