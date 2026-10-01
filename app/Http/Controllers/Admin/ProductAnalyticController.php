<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductAnalytic;
use Illuminate\Http\Request;

class ProductAnalyticController extends Controller
{
    public function index(Product $product)
    {
        $analytics = $product->analytics;
        return view('admin.analytics.index', compact('product','analytics'));
    }

    public function create(Product $product)
    {
        return view('admin.analytics.create', compact('product'));
    }

    public function store(Request $request, Product $product)
    {
        $data = $request->validate([
            'label' => 'required|string',
            'value' => 'required|string',
            'unit'  => 'required|string',
        ]);
        $data['product_id'] = $product->id;
        ProductAnalytic::create($data);
        return redirect()->route('admin.products.analytics.index', $product)->with('success', 'Valeur ajoutée.');
    }

    public function edit(Product $product, ProductAnalytic $analytic)
    {
        return view('admin.analytics.create', compact('product', 'analytic'));
    }

    public function update(Request $request, Product $product, ProductAnalytic $analytic)
    {
        $data = $request->validate([
            'label' => 'required|string',
            'value' => 'required|string',
            'unit'  => 'required|string',
        ]);
        $analytic->update($data);
        return redirect()->route('admin.products.analytics.index', $product)->with('success', 'Valeur modifiée.');
    }

    public function destroy(Product $product, ProductAnalytic $analytic)
    {
        $analytic->delete();
        return back()->with('success', 'Valeur supprimée.');
    }
}
