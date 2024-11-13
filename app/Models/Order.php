<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'orders';
    protected $fillable = [
        'user_id',
        'discount_code',
        'total_money',
        'transport_fee',
        'status',
        'delivery',
        'recipient_name',
        'recipient_phone_number',
        'delivery_address',
        'payment_method'
    ];
}
