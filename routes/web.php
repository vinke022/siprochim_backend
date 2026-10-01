<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\ProductFamilyController;
use App\Http\Controllers\Admin\ProductCategoryController;
use App\Http\Controllers\Admin\ProductSubcategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProductAnalyticController;
use App\Http\Controllers\Admin\ProductAccordionController;
use App\Http\Controllers\Admin\PostController;
use App\Http\Controllers\Admin\JobOfferAdminController;
use App\Http\Controllers\Admin\JobApplicationAdminController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Auth;


Route::get('/', function () {
    if (Auth::check()) {
        return redirect('/dashboard');
    }
    return redirect()->route('login');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::prefix('admin')->name('admin.')->middleware(['auth'])->group(function () {
    Route::resource('families', ProductFamilyController::class);
    Route::resource('product-categories', ProductCategoryController::class);
    Route::resource('product-subcategories', ProductSubcategoryController::class);
    Route::resource('products', ProductController::class);
    Route::resource('products.analytics', ProductAnalyticController::class);
    Route::resource('products.accordions', ProductAccordionController::class);
    
    // Routes AJAX pour les sélecteurs dépendants
    Route::get('ajax/categories-by-family/{familyId}', [ProductController::class, 'getCategoriesByFamily']);
    Route::get('ajax/subcategories-by-category/{categoryId}', [ProductController::class, 'getSubcategoriesByCategory']);
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::prefix('admin')->name('admin.')->middleware(['auth'])->group(function () {
    Route::resource('posts', PostController::class);
    Route::resource('job-offers', JobOfferAdminController::class);
    Route::resource('job-applications', JobApplicationAdminController::class)
        ->only(['index', 'show', 'update', 'destroy']);
});

require __DIR__.'/auth.php';
