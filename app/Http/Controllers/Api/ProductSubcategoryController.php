<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductSubcategory;
use App\Models\ProductCategory;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class ProductSubcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $subcategories = ProductSubcategory::with(['category.family', 'products'])
            ->withCount('products')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $subcategories,
            'message' => 'Sous-catégories récupérées avec succès'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'product_category_id' => 'required|exists:product_categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
            'slug' => [
                'nullable',
                'string',
                'max:255',
                \Illuminate\Validation\Rule::unique('product_subcategories')->where(function ($query) use ($request) {
                    return $query->where('product_category_id', $request->input('product_category_id'));
                })
            ],
        ]);

        $data['slug'] = Str::slug($data['name']);

        $subcategory = ProductSubcategory::create($data);
        $subcategory->load(['category.family']);

        return response()->json([
            'success' => true,
            'data' => $subcategory,
            'message' => 'Sous-catégorie créée avec succès'
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ProductSubcategory $subcategory): JsonResponse
    {
        $subcategory->load(['category.family', 'products']);

        return response()->json([
            'success' => true,
            'data' => $subcategory,
            'message' => 'Sous-catégorie récupérée avec succès'
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductSubcategory $subcategory): JsonResponse
    {
        $data = $request->validate([
            'product_category_id' => 'required|exists:product_categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
            'slug' => [
                'nullable',
                'string',
                'max:255',
                \Illuminate\Validation\Rule::unique('product_subcategories')->where(function ($query) use ($request, $subcategory) {
                    return $query->where('product_category_id', $request->input('product_category_id'));
                })->ignore($subcategory->id),
            ],
        ]);

        $data['slug'] = Str::slug($data['name']);

        $subcategory->update($data);
        $subcategory->load(['category.family']);

        return response()->json([
            'success' => true,
            'data' => $subcategory,
            'message' => 'Sous-catégorie mise à jour avec succès'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductSubcategory $subcategory): JsonResponse
    {
        $subcategory->delete();

        return response()->json([
            'success' => true,
            'message' => 'Sous-catégorie supprimée avec succès'
        ]);
    }

    /**
     * Get products of a specific subcategory
     */
    public function products($identifier): JsonResponse
    {
        $subcategory = ProductSubcategory::where('slug', $identifier)
            ->orWhere('id', $identifier)
            ->first();
    
        if (!$subcategory) {
            return response()->json([
                'success' => false,
                'message' => 'Sous-catégorie non trouvée'
            ], 404);
        }
    
        $products = $subcategory->products()->with(['analytics', 'accordions'])->get();
    
        return response()->json([
            'success' => true,
            'data' => $products,
            'message' => 'Produits de la sous-catégorie récupérés avec succès'
        ]);
    }


    /**
     * Get subcategories by category
     */
    public function byCategory(ProductCategory $category): JsonResponse
    {
        $subcategories = $category->subcategories()->with('products')->get();

        return response()->json([
            'success' => true,
            'data' => $subcategories,
            'message' => 'Sous-catégories de la catégorie récupérées avec succès'
        ]);
    }

    /**
     * Find subcategory by ID or slug
     */
    public function findBySlugOrId($identifier): JsonResponse
    {
        $subcategory = ProductSubcategory::where('slug', $identifier)
            ->orWhere('id', $identifier)
            ->with(['category.family', 'products'])
            ->first();

        if (!$subcategory) {
            return response()->json([
                'success' => false,
                'message' => 'Sous-catégorie non trouvée'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $subcategory,
            'message' => 'Sous-catégorie récupérée avec succès'
        ]);
    }
}
