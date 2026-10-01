<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductFamilyController;
use App\Http\Controllers\Api\ProductCategoryController;
use App\Http\Controllers\Api\ProductSubcategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProductAnalyticController;
use App\Http\Controllers\Api\ProductAccordionController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\HierarchyController;
use App\Http\Controllers\Api\JobOfferController;
use App\Http\Controllers\Api\JobApplicationController;

// Routes pour la hiérarchie des produits
Route::prefix('v1')->group(function () {
    // Hiérarchie complète
    Route::get('hierarchy', [HierarchyController::class, 'index']);
    Route::get('hierarchy/family/{family}', [HierarchyController::class, 'family']);
    Route::get('hierarchy/category/{category}', [HierarchyController::class, 'category']);
    Route::get('hierarchy/subcategory/{subcategory}', [HierarchyController::class, 'subcategory']);
    Route::get('hierarchy/product/{product}', [HierarchyController::class, 'product']);
    Route::get('hierarchy/breadcrumb', [HierarchyController::class, 'breadcrumb']);
    Route::get('hierarchy/statistics', [HierarchyController::class, 'statistics']);
    
    // Familles
    Route::apiResource('families', ProductFamilyController::class);
    Route::get('families/{family}/categories', [ProductFamilyController::class, 'categories']);
    Route::get('families/{family}/subcategories', [ProductFamilyController::class, 'subcategories']);
    
    // Routes alternatives pour slug/id
    Route::get('families/find/{identifier}', [ProductFamilyController::class, 'findBySlugOrId']);
    
    // Catégories
    Route::apiResource('categories', ProductCategoryController::class);
    Route::get('categories/{category}/subcategories', [ProductCategoryController::class, 'subcategories']);
    Route::get('families/{family}/categories', [ProductCategoryController::class, 'byFamily']);
    
    // Routes alternatives pour slug/id
    Route::get('categories/find/{identifier}', [ProductCategoryController::class, 'findBySlugOrId']);
    
    // Sous-catégories
    Route::apiResource('subcategories', ProductSubcategoryController::class);
    Route::get('subcategories/{identifier}/products', [ProductSubcategoryController::class, 'products']);
    Route::get('categories/{category}/subcategories', [ProductSubcategoryController::class, 'byCategory']);
    
    // Routes alternatives pour slug/id
    Route::get('subcategories/find/{identifier}', [ProductSubcategoryController::class, 'findBySlugOrId']);
    
    // Produits
    Route::apiResource('products', ProductController::class);
    Route::get('products/{product}/hierarchy', [ProductController::class, 'hierarchy']);
    Route::get('products/search', [ProductController::class, 'search']);
    Route::get('subcategories/{subcategory}/products', [ProductController::class, 'bySubcategory']);
    
    // Routes alternatives pour slug/id
    Route::get('products/find/{identifier}', [ProductController::class, 'findBySlugOrId']);
    
    // Analytics et accordions
    Route::apiResource('analytics', ProductAnalyticController::class);
    Route::apiResource('accordions', ProductAccordionController::class);
    Route::get('products/{product}/analytics', [ProductAnalyticController::class, 'byProduct']);
    Route::get('products/{product}/accordions', [ProductAccordionController::class, 'byProduct']);
    
    // Posts
    Route::apiResource('posts', PostController::class);

    // Offres d'emploi
    Route::get('job-offers', [JobOfferController::class, 'index']);
    Route::get('job-offers/{slug}', [JobOfferController::class, 'show']);
    Route::post('job-offers', [JobOfferController::class, 'store']);
    Route::put('job-offers/{slug}', [JobOfferController::class, 'update']);
    Route::delete('job-offers/{slug}', [JobOfferController::class, 'destroy']);

    // Candidatures (public — pas d'auth requise)
    Route::post('job-applications', [JobApplicationController::class, 'store']);
});

// Routes de compatibilité (anciennes)
Route::apiResource('families', ProductFamilyController::class);
Route::apiResource('products', ProductController::class);
Route::apiResource('analytics', ProductAnalyticController::class);
Route::apiResource('accordions', ProductAccordionController::class);
Route::apiResource('posts', PostController::class);

// Routes spéciales pour les sélecteurs en cascade
Route::get('families/{family}/categories', [ProductCategoryController::class, 'byFamily']);
Route::get('categories/{category}/subcategories', [ProductSubcategoryController::class, 'byCategory']);

