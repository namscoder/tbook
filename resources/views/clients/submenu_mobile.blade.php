<ul class="submenu_mobile1">
    @foreach ($subcategories as $subcategory)
        <li>
            <a href="{{ route('product',['id' => $subcategory->id]) }}">{{ $subcategory->category_name }}</a>
            @if ($subcategory->children->count() > 0) <!-- Nếu có danh mục con -->
                <i class="fa-solid fa-chevron-right"></i>
                @include('clients.submenu_mobile', ['subcategories' => $subcategory->children]) <!-- Gọi đệ quy view con -->
            @endif
        </li>
    @endforeach
</ul>