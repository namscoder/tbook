<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'books';
    protected $fillable = [
        'book_title',
        'price',
        'promotion_price',
        'publishing_year',
        'quantity',
        'cate_id',
        'image',
        'description',
        'publisher_id'
    ];

    public function reviews()
    {
        return $this->hasMany(Review::class, 'book_id');
    }
    public function publishers()
    {
        return $this->hasMany(Publisher::class, 'publisher_id');
    }
    public function authors()
    {
        return $this->belongsToMany(Author::class, 'participates', 'book_id', 'author_id');

    }
    public function category(){
        return $this->hasMany(Category::class, 'cate_id');
    }
}
