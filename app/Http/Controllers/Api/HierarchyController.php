<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductFamily;
use App\Models\ProductCategory;
use App\Models\ProductSubcategory;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class HierarchyController extends Controller
{
    /**
     * Get complete hierarchy tree
     */
    public function index(): JsonResponse
    {
        $hierarchy = ProductFamily::with([
            'categories' => function ($query) {
                $query->with([
                    'subcategories' => function ($subQuery) {
                        $subQuery->with('products')->withCount('products');
                    }
                ])->withCount('subcategories');
            }
        ])->withCount(['categories', 'subcategories'])->get();

        return response()->json([
            'success' => true,
            'data' => $hierarchy,
            'message' => 'Hiérarchie complète récupérée avec succès'
        ]);
    }

    /**
     * Get hierarchy for a specific family
     */
    public function family(ProductFamily $family): JsonResponse
    {
        $family->load([
            'categories' => function ($query) {
                $query->with([
                    'subcategories' => function ($subQuery) {
                        $subQuery->with('products')->withCount('products');
                    }
                ])->withCount('subcategories');
            }
        ]);

        return response()->json([
            'success' => true,
            'data' => $family,
            'message' => 'Hiérarchie de la famille récupérée avec succès'
        ]);
    }

    /**
     * Get hierarchy for a specific category
     */
    public function category(ProductCategory $category): JsonResponse
    {
        $category->load([
            'family',
            'subcategories' => function ($query) {
                $query->with('products')->withCount('products');
            }
        ]);

        return response()->json([
            'success' => true,
            'data' => $category,
            'message' => 'Hiérarchie de la catégorie récupérée avec succès'
        ]);
    }

    /**
     * Get hierarchy for a specific subcategory
     */
    public function subcategory(ProductSubcategory $subcategory): JsonResponse
    {
        $subcategory->load([
            'category.family',
            'products' => function ($query) {
                $query->with(['analytics', 'accordions']);
            }
        ]);

        return response()->json([
            'success' => true,
            'data' => $subcategory,
            'message' => 'Hiérarchie de la sous-catégorie récupérée avec succès'
        ]);
    }

    /**
     * Get full path for a product
     */
    public function product(Product $product): JsonResponse
    {
        $product->load([
            'subcategory.category.family',
            'analytics',
            'accordions'
        ]);

        $path = [
            'family' => $product->subcategory->category->family,
            'category' => $product->subcategory->category,
            'subcategory' => $product->subcategory,
            'product' => $product
        ];

        return response()->json([
            'success' => true,
            'data' => $path,
            'message' => 'Chemin complet du produit récupéré avec succès'
        ]);
    }

    /**
     * Get breadcrumb for navigation
     */
    public function breadcrumb(Request $request): JsonResponse
    {
        $type = $request->get('type');
        $id = $request->get('id');

        $breadcrumb = [];

        switch ($type) {
            case 'family':
                $family = ProductFamily::find($id);
                if ($family) {
                    $breadcrumb = [
                        ['type' => 'family', 'id' => $family->id, 'name' => $family->name, 'slug' => $family->slug]
                    ];
                }
                break;

            case 'category':
                $category = ProductCategory::with('family')->find($id);
                if ($category) {
                    $breadcrumb = [
                        ['type' => 'family', 'id' => $category->family->id, 'name' => $category->family->name, 'slug' => $category->family->slug],
                        ['type' => 'category', 'id' => $category->id, 'name' => $category->name, 'slug' => $category->slug]
                    ];
                }
                break;

            case 'subcategory':
                $subcategory = ProductSubcategory::with('category.family')->find($id);
                if ($subcategory) {
                    $breadcrumb = [
                        ['type' => 'family', 'id' => $subcategory->category->family->id, 'name' => $subcategory->category->family->name, 'slug' => $subcategory->category->family->slug],
                        ['type' => 'category', 'id' => $subcategory->category->id, 'name' => $subcategory->category->name, 'slug' => $subcategory->category->slug],
                        ['type' => 'subcategory', 'id' => $subcategory->id, 'name' => $subcategory->name, 'slug' => $subcategory->slug]
                    ];
                }
                break;

            case 'product':
                $product = Product::with('subcategory.category.family')->find($id);
                if ($product) {
                    $breadcrumb = [
                        ['type' => 'family', 'id' => $product->subcategory->category->family->id, 'name' => $product->subcategory->category->family->name, 'slug' => $product->subcategory->category->family->slug],
                        ['type' => 'category', 'id' => $product->subcategory->category->id, 'name' => $product->subcategory->category->name, 'slug' => $product->subcategory->category->slug],
                        ['type' => 'subcategory', 'id' => $product->subcategory->id, 'name' => $product->subcategory->name, 'slug' => $product->subcategory->slug],
                        ['type' => 'product', 'id' => $product->id, 'name' => $product->name, 'slug' => $product->slug]
                    ];
                }
                break;
        }

        return response()->json([
            'success' => true,
            'data' => $breadcrumb,
            'message' => 'Fil d\'ariane récupéré avec succès'
        ]);
    }

    /**
     * Get statistics for the hierarchy
     */
    public function statistics(): JsonResponse
    {
        $stats = [
            'families' => ProductFamily::count(),
            'categories' => ProductCategory::count(),
            'subcategories' => ProductSubcategory::count(),
            'products' => Product::count(),
            'families_with_categories' => ProductFamily::has('categories')->count(),
            'categories_with_subcategories' => ProductCategory::has('subcategories')->count(),
            'subcategories_with_products' => ProductSubcategory::has('products')->count(),
        ];

        return response()->json([
            'success' => true,
            'data' => $stats,
            'message' => 'Statistiques récupérées avec succès'
        ]);
    }
}
