<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Author extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'authors';
    protected $fillable = [
        'author_name',
        'gender',
        // 'birthday',
        // 'address',
        // 'biography'
    ];
    public function books()
    {
        return $this->belongsToMany(Book::class, 'participates', 'author_id', 'book_id');
    }
}
