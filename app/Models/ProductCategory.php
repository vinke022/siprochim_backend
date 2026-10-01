<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $fillable = ['product_family_id', 'name', 'slug', 'image', 'description'];

    /**
     * Get the route key for the model.
     */
    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function family()
    {
        return $this->belongsTo(ProductFamily::class, 'product_family_id');
    }

    public function subcategories()
    {
        return $this->hasMany(ProductSubcategory::class);
    }

    public function products()
    {
        return $this->hasManyThrough(Product::class, ProductSubcategory::class);
    }
}
