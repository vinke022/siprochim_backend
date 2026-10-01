<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProductCategory;
use App\Models\ProductFamily;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProductCategoryController extends Controller
{
    public function index()
    {
        $categories = ProductCategory::with('family')->latest()->get();
        return view('admin.product-categories.index', compact('categories'));
    }

    public function create()
    {
        $families = ProductFamily::all();
        return view('admin.product-categories.create', compact('families'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'product_family_id' => 'required|exists:product_families,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
            'slug' => [
                'nullable',
                'string',
                'max:255',
                \Illuminate\Validation\Rule::unique('product_categories')->where(function ($query) use ($request) {
                    return $query->where('product_family_id', $request->input('product_family_id'));
                })
            ],
        ]);

        $baseSlug = Str::slug($data['name']);
        $slug = $baseSlug;
        $i = 1;
        while (\App\Models\ProductCategory::where('slug', $slug)->where('product_family_id', '!=', $data['product_family_id'])->exists() || \App\Models\ProductCategory::where('slug', $slug)->where('product_family_id', $data['product_family_id'])->exists()) {
            $slug = $baseSlug . '-' . $i;
            $i++;
        }
        $data['slug'] = $slug;

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('product_categories'), $filename);
            $data['image'] = 'product_categories/' . $filename;
        }

        ProductCategory::create($data);
        return redirect()->route('admin.product-categories.index')->with('success', 'Catégorie créée avec succès.');
    }

    public function edit(ProductCategory $productCategory)
    {
        $families = ProductFamily::all();
        return view('admin.product-categories.create', compact('productCategory', 'families'));
    }

    public function update(Request $request, ProductCategory $productCategory)
    {
        $data = $request->validate([
            'product_family_id' => 'required|exists:product_families,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
            'slug' => [
                'nullable',
                'string',
                'max:255',
                \Illuminate\Validation\Rule::unique('product_categories')->where(function ($query) use ($request, $productCategory) {
                    return $query->where('product_family_id', $request->input('product_family_id'));
                })->ignore($productCategory->id),
            ],
        ]);

        $baseSlug = Str::slug($data['name']);
        $slug = $baseSlug;
        $i = 1;
        while (\App\Models\ProductCategory::where('slug', $slug)->where('product_family_id', '!=', $data['product_family_id'])->exists() || \App\Models\ProductCategory::where('slug', $slug)->where('product_family_id', $data['product_family_id'])->where('id', '!=', $productCategory->id)->exists()) {
            $slug = $baseSlug . '-' . $i;
            $i++;
        }
        $data['slug'] = $slug;

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('product_categories'), $filename);
            $data['image'] = 'product_categories/' . $filename;
        }

        $productCategory->update($data);
        return redirect()->route('admin.product-categories.index')->with('success', 'Catégorie mise à jour avec succès.');
    }

    public function destroy(ProductCategory $productCategory)
    {
        $productCategory->delete();
        return back()->with('success', 'Catégorie supprimée avec succès.');
    }
}
