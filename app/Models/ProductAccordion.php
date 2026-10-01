<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductAccordion extends Model
{
    protected $fillable = ['product_id','title','content'];
    public function product() { return $this->belongsTo(Product::class); }
}
