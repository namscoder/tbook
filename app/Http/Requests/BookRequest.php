<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class BookRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [];
        $today = getdate();
        $method = $this->route()->getActionMethod();
        switch ($this->method()) {
            case 'POST':
                switch ($method) {
                    case 'store':
                        $rules = [
                            'book_title' => 'required|unique:books,book_title',
                            'price' => 'required|integer|min:1',
                            'promotion_price' => 'integer|lt:price',
                            'publishing_year' => 'required|integer|min:2010|max:' . $today['year'],
                            'quantity' => 'required|integer|min:1',
                            'cate_id' => 'required',
                            'image' => 'required',
                            'description' => 'required',
                            'author_id' => 'required',
                            'publisher_id' => 'required',
                        ];
                        break;

                    case 'update':
                        $rules = [
                            'book_title' => [
                                'required',
                                Rule::unique('books')->ignore($this->id)
                            ],
                            'price' => 'required|integer|min:1',
                            'promotion_price' => 'integer|lt:price',
                            'publishing_year' => 'required|integer|min:2010|max:' . $today['year'],
                            'quantity' => 'required|integer|min:1',
                            'cate_id' => 'required',
                            'description' => 'required',
                            'author_id' => 'required',
                            'publisher_id' => 'required'
                        ];
                        break;
                }
                break;
        }
        return $rules;
    }

    public function messages()
    {
        $today = getdate();
        return [
            'book_title.required' => "Tiêu đề sách không được để trống",
            'book_title.unique' => "Tiêu đề sách đã tồn tại",
            'price.required' => "Giá sách không được để trống",
            'price.integer' || 'price.min' => "Giá sách phải là số nguyên và lớn hơn 0",
            'promotion_price.lt' => 'Giá giảm phải nhỏ hơn giá gốc',
            'publishing_year.required' => "Năm xuất bản không được để trống",
            'publishing_year.integer' || 'publishing_year.min' || 'publishing_year.max' => "Năm xuất bản phải là số nguyên và nằm trong khoảng từ năm 2010 đến năm " . $today['year'],
            'quantity.required' => "Số lượng sách không được để trống",
            'quantity.integer' || 'quantity.min' => "Số lượng sách phải là số nguyên và lớn hơn 0",
            'cate_id.required' => "Chưa chọn thể loại sách",
            'image.required' => "Chưa chọn ảnh bìa sách",
            'description.required' => "Mô tả sách không được để trống",
            'publisher_id.required' => "Chưa chọn nhà xuất bản",
            'author_id.required' => "Chưa chọn tác giả",
        ];
    }
}
