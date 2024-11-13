<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'categories';
    protected $fillable = [
        'category_name',
        'description',
        'cate_id'
    ];

    protected $primaryKey = 'id';

    // Khai báo mối quan hệ danh mục cha con

    public function parent()
    {
        return $this->belongsTo('App\Models\Category', 'cate_id');
    }

    public function children()
    {
        return $this->hasMany('App\Models\Category', 'cate_id');
    }
}
