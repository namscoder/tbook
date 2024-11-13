<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class PromotionRequest extends FormRequest
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
        $method = $this->route()->getActionMethod();
        switch ($this->method()) {
            case 'POST':
                switch ($method) {
                    case 'store':
                        $rules = [
                            'discount_code' => 'required|regex:/\d/|regex:/[a-zA-Z]/|min:5|unique:promotions,discount_code',
                            'event' => 'required',
                            'start' => 'required|date|after:today',
                            'end' => 'required|date|after_or_equal:' . $this->start,
                            'discount_percent' => 'required|integer|between:1,100'
                        ];
                        break;
                    case 'update':
                        $rules = [
                            'discount_code' => [
                                'required',
                                'regex:/\d/',
                                'regex:/[a-zA-Z]/',
                                'min:5',
                                Rule::unique('promotions')->ignore($this->id)
                            ],
                            'event' => 'required',
                            'start' => 'required|date|after:today',
                            'end' => 'required|date|after_or_equal:' . $this->start,
                            'discount_percent' => 'required|integer|between:1,100'
                        ];
                        break;
                }

                break;
            default:
                break;
        }
        return $rules;
    }

    public function messages()
    {
        return [
            'discount_code.required' => "Mã giảm giá không được để trống",
            'discount_code.regex' => "Mã giảm giá phải gồm cả chữ và số",
            'discount_code.min' => "Mã giảm giá tối thiểu 5 kí tự",
            'discount_code.unique' => "Mã giảm giá đã tồn tại",
            'event.required' => "Sự kiện giảm giá không được để trống",
            'start.required' => "Ngày bắt đầu áp dụng sự kiện giảm giá không được để trống",
            'start.date' => "Ngày bắt đầu áp dụng giảm giá phải là date",
            'start.after' => "Ngày bắt đầu áp dụng giảm giá phải sau ngày hôm nay",
            'end.required' => "Ngày dừng áp dụng sự kiện giảm giá không được để trống",
            'end.date' => "Ngày dừng áp dụng giảm giá phải là date",
            'end.after_or_equal' => "Ngày dừng áp dụng giảm giá phải bằng hoặc sau ngày bắt đầu áp dụng",
            'discount_percent.required' => "Phần trăm giảm giá không được để trống",
            'discount_percent.integer' => "Phần trăm giảm giá phải là số nguyên và nằm trong khoảng 0->100",
            'discount_percent.between' => "Phần trăm giảm giá phải là số nguyên và nằm trong khoảng 0->100",
        ];
    }
}
