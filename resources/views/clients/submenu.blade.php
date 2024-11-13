<ul class="submenu2">
    @foreach ($subcategories as $subcategory)
        <li>
            <a href="{{ route('product',['id' => $subcategory->id]) }}">{{ $subcategory->category_name }}</a>
            @if ($subcategory->children->count() > 0) <!-- Nếu có danh mục con -->
                @include('clients.submenu', ['subcategories' => $subcategory->children]) <!-- Gọi đệ quy view con -->
            @endif
        </li>
    @endforeach
</ul>