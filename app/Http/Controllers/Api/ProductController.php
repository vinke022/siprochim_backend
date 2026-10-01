<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductSubcategory;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $products = Product::with(['subcategory.category.family', 'analytics', 'accordions'])
            ->withCount(['analytics', 'accordions'])
            ->get();

        return response()->json([
            'success' => true,
            'data' => $products,
            'message' => 'Produits récupérés avec succès'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'product_subcategory_id' => 'required|exists:product_subcategories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
        ]);

        $data['slug'] = Str::slug($data['name']);

        $product = Product::create($data);
        $product->load(['subcategory.category.family']);

        return response()->json([
            'success' => true,
            'data' => $product,
            'message' => 'Produit créé avec succès'
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product): JsonResponse
    {
        $product->load(['subcategory.category.family', 'analytics', 'accordions']);

        return response()->json([
            'success' => true,
            'data' => $product,
            'message' => 'Produit récupéré avec succès'
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product): JsonResponse
    {
        $data = $request->validate([
            'product_subcategory_id' => 'required|exists:product_subcategories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
        ]);

        $data['slug'] = Str::slug($data['name']);

        $product->update($data);
        $product->load(['subcategory.category.family']);

        return response()->json([
            'success' => true,
            'data' => $product,
            'message' => 'Produit mis à jour avec succès'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product): JsonResponse
    {
        $product->delete();

        return response()->json([
            'success' => true,
            'message' => 'Produit supprimé avec succès'
        ]);
    }

    /**
     * Get products by subcategory
     */
    public function bySubcategory(ProductSubcategory $subcategory): JsonResponse
    {
        $products = $subcategory->products()->with(['analytics', 'accordions'])->get();

        return response()->json([
            'success' => true,
            'data' => $products,
            'message' => 'Produits de la sous-catégorie récupérés avec succès'
        ]);
    }

    /**
     * Get full hierarchy for a product
     */
    public function hierarchy(Product $product): JsonResponse
    {
        $hierarchy = [
            'family' => $product->subcategory->category->family,
            'category' => $product->subcategory->category,
            'subcategory' => $product->subcategory,
            'product' => $product
        ];

        return response()->json([
            'success' => true,
            'data' => $hierarchy,
            'message' => 'Hiérarchie du produit récupérée avec succès'
        ]);
    }

    /**
     * Search products
     */
    public function search(Request $request): JsonResponse
    {
        $query = $request->get('q', '');
        $familyId = $request->get('family_id');
        $categoryId = $request->get('category_id');
        $subcategoryId = $request->get('subcategory_id');

        $products = Product::query()
            ->with(['subcategory.category.family'])
            ->when($query, function ($q) use ($query) {
                $q->where('name', 'like', "%{$query}%")
                  ->orWhere('description', 'like', "%{$query}%");
            })
            ->when($familyId, function ($q) use ($familyId) {
                $q->whereHas('subcategory.category.family', function ($subQ) use ($familyId) {
                    $subQ->where('id', $familyId);
                });
            })
            ->when($categoryId, function ($q) use ($categoryId) {
                $q->whereHas('subcategory.category', function ($subQ) use ($categoryId) {
                    $subQ->where('id', $categoryId);
                });
            })
            ->when($subcategoryId, function ($q) use ($subcategoryId) {
                $q->where('product_subcategory_id', $subcategoryId);
            })
            ->get();

        return response()->json([
            'success' => true,
            'data' => $products,
            'message' => 'Résultats de recherche récupérés avec succès'
        ]);
    }

    /**
     * Find product by ID or slug
     */
    public function findBySlugOrId($identifier): JsonResponse
    {
        $product = Product::where('slug', $identifier)
            ->orWhere('id', $identifier)
            ->with(['subcategory.category.family', 'analytics', 'accordions'])
            ->first();

        if (!$product) {
            return response()->json([
                'success' => false,
                'message' => 'Produit non trouvé'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $product,
            'message' => 'Produit récupéré avec succès'
        ]);
    }
}
