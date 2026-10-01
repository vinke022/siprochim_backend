<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductFamily;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class ProductFamilyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $families = ProductFamily::with(['categories', 'subcategories'])
            ->withCount(['categories', 'subcategories'])
            ->get();

        return response()->json([
            'success' => true,
            'data' => $families,
            'message' => 'Familles récupérées avec succès'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|string',
        ]);

        $data['slug'] = Str::slug($data['name']);

        $family = ProductFamily::create($data);

        return response()->json([
            'success' => true,
            'data' => $family,
            'message' => 'Famille créée avec succès'
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ProductFamily $family): JsonResponse
    {
        $family->load(['categories.subcategories', 'subcategories.products']);

        return response()->json([
            'success' => true,
            'data' => $family,
            'message' => 'Famille récupérée avec succès'
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductFamily $family): JsonResponse
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|string',
        ]);

        $data['slug'] = Str::slug($data['name']);

        $family->update($data);

        return response()->json([
            'success' => true,
            'data' => $family,
            'message' => 'Famille mise à jour avec succès'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductFamily $family): JsonResponse
    {
        $family->delete();

        return response()->json([
            'success' => true,
            'message' => 'Famille supprimée avec succès'
        ]);
    }

    /**
     * Get categories of a specific family
     */
    public function categories(ProductFamily $family): JsonResponse
    {
        $categories = $family->categories()->with('subcategories')->get();

        return response()->json([
            'success' => true,
            'data' => $categories,
            'message' => 'Catégories de la famille récupérées avec succès'
        ]);
    }

    /**
     * Get subcategories of a specific family
     */
    public function subcategories(ProductFamily $family): JsonResponse
    {
        $subcategories = $family->subcategories()->with('category')->get();

        return response()->json([
            'success' => true,
            'data' => $subcategories,
            'message' => 'Sous-catégories de la famille récupérées avec succès'
        ]);
    }

    /**
     * Find family by ID or slug
     */
    public function findBySlugOrId($identifier): JsonResponse
    {
        $family = ProductFamily::where('slug', $identifier)
            ->orWhere('id', $identifier)
            ->with(['categories.subcategories', 'subcategories.products'])
            ->first();

        if (!$family) {
            return response()->json([
                'success' => false,
                'message' => 'Famille non trouvée'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $family,
            'message' => 'Famille récupérée avec succès'
        ]);
    }
}
