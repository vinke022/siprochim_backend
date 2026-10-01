<?php



namespace App\Models;



use Illuminate\Database\Eloquent\Model;



class ProductSubcategory extends Model

{

    protected $fillable = ['product_category_id', 'name', 'slug', 'image', 'description'];



    /**

     * Get the route key for the model.

     */

    public function getRouteKeyName()

    {

        return 'slug';

    }



    public function category()

    {

        return $this->belongsTo(ProductCategory::class, 'product_category_id');

    }



    public function products()

    {

        return $this->hasMany(Product::class);

    }



    /**
     * Accessor to retrieve the family directly via the loaded category relationship.
     * Allows using $subcategory->family similarly to a relation while keeping eager loading via category.family.
     */
    public function getFamilyAttribute()
    {
        // If category is loaded (with nested family) this will not trigger extra queries.
        return optional($this->category)->family;
    }

}

