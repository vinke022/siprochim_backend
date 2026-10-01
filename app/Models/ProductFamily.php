<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductFamily extends Model
{
    protected $fillable = ['name', 'slug', 'image'];
    
    /**
     * Get the route key for the model.
     */
    public function getRouteKeyName()
    {
        return 'slug';
    }
    
    public function categories()
    {
        return $this->hasMany(ProductCategory::class);
    }
    
    public function subcategories()
    {
        return $this->hasManyThrough(ProductSubcategory::class, ProductCategory::class);
    }
    
    public function products()
    {
        return $this->hasManyThrough(Product::class, ProductSubcategory::class, 'product_category_id', 'product_subcategory_id', 'id', 'id')
            ->join('product_categories', 'product_subcategories.product_category_id', '=', 'product_categories.id')
            ->where('product_categories.product_family_id', $this->id);
    }
}
