<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order_Detail extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'order_details';
    protected $fillable = [
        'order_id',
        'book_id',
        'quantity',
        'price'
    ];
}
