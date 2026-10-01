<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductCategory;
use App\Models\ProductFamily;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class ProductCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $categories = ProductCategory::with(['family', 'subcategories'])
            ->withCount('subcategories')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $categories,
            'message' => 'Catégories récupérées avec succès'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'product_family_id' => 'required|exists:product_families,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
            'slug' => [
                'nullable',
                'string',
                'max:255',
                \Illuminate\Validation\Rule::unique('product_categories')->where(function ($query) use ($request) {
                    return $query->where('product_family_id', $request->input('product_family_id'));
                })
            ],
        ]);

        $data['slug'] = Str::slug($data['name']);

        $category = ProductCategory::create($data);
        $category->load('family');

        return response()->json([
            'success' => true,
            'data' => $category,
            'message' => 'Catégorie créée avec succès'
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ProductCategory $category): JsonResponse
    {
        $category->load(['family', 'subcategories.products']);

        return response()->json([
            'success' => true,
            'data' => $category,
            'message' => 'Catégorie récupérée avec succès'
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductCategory $category): JsonResponse
    {
        $data = $request->validate([
            'product_family_id' => 'required|exists:product_families,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
            'slug' => [
                'nullable',
                'string',
                'max:255',
                \Illuminate\Validation\Rule::unique('product_categories')->where(function ($query) use ($request, $category) {
                    return $query->where('product_family_id', $request->input('product_family_id'));
                })->ignore($category->id),
            ],
        ]);

        $data['slug'] = Str::slug($data['name']);

        $category->update($data);
        $category->load('family');

        return response()->json([
            'success' => true,
            'data' => $category,
            'message' => 'Catégorie mise à jour avec succès'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductCategory $category): JsonResponse
    {
        $category->delete();

        return response()->json([
            'success' => true,
            'message' => 'Catégorie supprimée avec succès'
        ]);
    }

    /**
     * Get subcategories of a specific category
     */
    public function subcategories(ProductCategory $category): JsonResponse
    {
        $subcategories = $category->subcategories()->with('products')->get();

        return response()->json([
            'success' => true,
            'data' => $subcategories,
            'message' => 'Sous-catégories de la catégorie récupérées avec succès'
        ]);
    }

    /**
     * Get categories by family
     */
    public function byFamily(ProductFamily $family): JsonResponse
    {
        $categories = $family->categories()->with('subcategories')->get();

        return response()->json([
            'success' => true,
            'data' => $categories,
            'message' => 'Catégories de la famille récupérées avec succès'
        ]);
    }

    /**
     * Find category by ID or slug
     */
    public function findBySlugOrId($identifier): JsonResponse
    {
        $category = ProductCategory::where('slug', $identifier)
            ->orWhere('id', $identifier)
            ->with(['family', 'subcategories.products'])
            ->first();

        if (!$category) {
            return response()->json([
                'success' => false,
                'message' => 'Catégorie non trouvée'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $category,
            'message' => 'Catégorie récupérée avec succès'
        ]);
    }
}
