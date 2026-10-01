<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductAnalytic;
use Illuminate\Http\Request;

class ProductAnalyticController extends Controller
{
    public function index()
    {
        return response()->json(ProductAnalytic::all());
    }

    public function byProduct($productId)
    {
        return response()->json(ProductAnalytic::where('product_id', $productId)->get());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'label'      => 'required|string|max:255',
            'value'      => 'required|string|max:255',
            'unit'       => 'nullable|string|max:50',
        ]);
        $analytic = ProductAnalytic::create($validated);
        return response()->json($analytic, 201);
    }

    public function show(ProductAnalytic $analytic)
    {
        return response()->json($analytic);
    }

    public function update(Request $request, ProductAnalytic $analytic)
    {
        $validated = $request->validate([
            'label' => 'sometimes|required|string|max:255',
            'value' => 'sometimes|required|string|max:255',
            'unit'  => 'nullable|string|max:50',
        ]);
        $analytic->update($validated);
        return response()->json($analytic);
    }

    public function destroy(ProductAnalytic $analytic)
    {
        $analytic->delete();
        return response()->json(null, 204);
    }
}
