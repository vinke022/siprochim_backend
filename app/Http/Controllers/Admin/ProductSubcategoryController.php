<?php



namespace App\Http\Controllers\Admin;



use App\Http\Controllers\Controller;

use App\Models\ProductSubcategory;

use App\Models\ProductCategory;

use Illuminate\Http\Request;

use Illuminate\Support\Str;

use Illuminate\Validation\Rule;



class ProductSubcategoryController extends Controller

{

    public function index()

    {

        $subcategories = ProductSubcategory::with(['category', 'category.family'])->latest()->get();

        return view('admin.product-subcategories.index', compact('subcategories'));

    }



    public function create()

    {

        $categories = ProductCategory::with('family')->get();

        return view('admin.product-subcategories.create', compact('categories'));

    }



    public function store(Request $request)
    {
        $data = $request->validate([
            'product_category_id' => 'required|exists:product_categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
            'slug' => [
                'nullable',
                'string',
                'max:255',
            ],
        ]);

        $category = ProductCategory::find($data['product_category_id']);
        $rawSlugInput = $data['slug'] ?? null;
        $base = $rawSlugInput && trim($rawSlugInput) !== '' ? Str::slug($rawSlugInput) : Str::slug($data['name']);
        $categoryPrefix = $category ? Str::slug($category->slug ?? $category->name) : 'cat';
        $candidate = $categoryPrefix . '-' . $base;
        $original = $candidate;
        $i = 1;
        while (ProductSubcategory::where('slug', $candidate)->exists()) {
            $candidate = $original . '-' . $i++;
        }
        $data['slug'] = $candidate;

        if ($request->hasFile('image')) {
            $dir = public_path('product_subcategories');
            if (!is_dir($dir)) {
                mkdir($dir, 0775, true);
            }
            $file = $request->file('image');
            $filename = uniqid('psc_') . '.' . $file->getClientOriginalExtension();
            $file->move($dir, $filename);
            $data['image'] = 'product_subcategories/' . $filename;
        }

        ProductSubcategory::create($data);
        return redirect()->route('admin.product-subcategories.index')->with('success', 'Sous-catégorie créée avec succès.');
    }



    public function edit(ProductSubcategory $productSubcategory)

    {

        $categories = ProductCategory::with('family')->get();

        return view('admin.product-subcategories.create', compact('productSubcategory', 'categories'));

    }



    public function update(Request $request, ProductSubcategory $productSubcategory)
    {
        $data = $request->validate([
            'product_category_id' => 'required|exists:product_categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
            'slug' => [
                'nullable',
                'string',
                'max:255',
            ],
        ]);

    $category = ProductCategory::find($data['product_category_id']);
    $rawSlugInput = $data['slug'] ?? null;
    $base = $rawSlugInput && trim($rawSlugInput) !== '' ? Str::slug($rawSlugInput) : Str::slug($data['name']);
        $categoryPrefix = $category ? Str::slug($category->slug ?? $category->name) : 'cat';
        $candidate = $categoryPrefix . '-' . $base;
        $original = $candidate;
        $i = 1;
        while (ProductSubcategory::where('slug', $candidate)->where('id', '!=', $productSubcategory->id)->exists()) {
            $candidate = $original . '-' . $i++;
        }
        $data['slug'] = $candidate;

        if ($request->hasFile('image')) {
            $dir = public_path('product_subcategories');
            if (!is_dir($dir)) {
                mkdir($dir, 0775, true);
            }
            if ($productSubcategory->image && file_exists(public_path($productSubcategory->image))) {
                @unlink(public_path($productSubcategory->image));
            }
            $file = $request->file('image');
            $filename = uniqid('psc_') . '.' . $file->getClientOriginalExtension();
            $file->move($dir, $filename);
            $data['image'] = 'product_subcategories/' . $filename;
        }

        $productSubcategory->update($data);
        return redirect()->route('admin.product-subcategories.index')->with('success', 'Sous-catégorie mise à jour avec succès.');
    }



    public function destroy(ProductSubcategory $productSubcategory)

    {

        $productSubcategory->delete();

        return back()->with('success', 'Sous-catégorie supprimée avec succès.');

    }

}

