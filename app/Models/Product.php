<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['product_subcategory_id', 'name', 'slug', 'image', 'description', 'badge'];

    /**
     * Get the route key for the model.
     */
    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function subcategory()
    {
        return $this->belongsTo(ProductSubcategory::class, 'product_subcategory_id');
    }
    
    public function category()
    {
        return $this->hasOneThrough(ProductCategory::class, ProductSubcategory::class, 'id', 'id', 'product_subcategory_id', 'product_category_id');
    }
    
    public function family()
    {
        return $this->hasOneThrough(ProductFamily::class, ProductCategory::class, 'id', 'id', 'product_subcategory_id', 'product_family_id')
            ->join('product_subcategories', 'product_categories.id', '=', 'product_subcategories.product_category_id')
            ->where('product_subcategories.id', $this->product_subcategory_id);
    }

    public function analytics()
    {
        return $this->hasMany(ProductAnalytic::class);
    }
    
    public function accordions()
    {
        return $this->hasMany(ProductAccordion::class);
    }
}
