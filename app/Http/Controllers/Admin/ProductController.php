<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductSubcategory;
use App\Models\ProductCategory;
use App\Models\ProductFamily;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with(['subcategory', 'subcategory.category', 'subcategory.category.family'])->latest()->get();
        return view('admin.products.index', compact('products'));
    }

    public function create()
    {
        $families = ProductFamily::with(['categories', 'categories.subcategories'])->get();
        $subcategories = ProductSubcategory::with(['category', 'category.family'])->get();
        return view('admin.products.create', compact('families', 'subcategories'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'product_subcategory_id' => 'required|exists:product_subcategories,id',
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|max:2048',
            'description' => 'nullable|string',
            'badge' => 'nullable|in:nouveau,premium',
        ]);
        
        $data['slug'] = Str::slug($data['name']);
        
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('products'), $filename);
            $data['image'] = 'products/' . $filename;
        }
        
        Product::create($data);
        return redirect()->route('admin.products.index')->with('success', 'Produit créé avec succès.');
    }

    public function edit(Product $product)
    {
        $families = ProductFamily::with(['categories', 'categories.subcategories'])->get();
        $subcategories = ProductSubcategory::with(['category', 'category.family'])->get();
        return view('admin.products.create', compact('product', 'families', 'subcategories'));
    }

    public function update(Request $request, Product $product)
    {
        $data = $request->validate([
            'product_subcategory_id' => 'required|exists:product_subcategories,id',
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|max:2048',
            'description' => 'nullable|string',
            'badge' => 'nullable|in:nouveau,premium',
        ]);
        
        $data['slug'] = Str::slug($data['name']);
        
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('products'), $filename);
            $data['image'] = 'products/' . $filename;
        }
        
        $product->update($data);
        return redirect()->route('admin.products.index')->with('success', 'Produit mis à jour avec succès.');
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return back()->with('success', 'Produit supprimé avec succès.');
    }

    // Méthode AJAX pour récupérer les catégories d'une famille
    public function getCategoriesByFamily($familyId)
    {
        $categories = ProductCategory::where('product_family_id', $familyId)->with('subcategories')->get();
        return response()->json($categories);
    }

    // Méthode AJAX pour récupérer les sous-catégories d'une catégorie
    public function getSubcategoriesByCategory($categoryId)
    {
        $subcategories = ProductSubcategory::where('product_category_id', $categoryId)->get();
        return response()->json($subcategories);
    }
}
