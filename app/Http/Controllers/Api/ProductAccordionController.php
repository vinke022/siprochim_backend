<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductAccordion;
use Illuminate\Http\Request;

class ProductAccordionController extends Controller
{
    public function index()
    {
        return response()->json(ProductAccordion::all());
    }

    public function byProduct($productId)
    {
        return response()->json(ProductAccordion::where('product_id', $productId)->get());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'title'      => 'required|string|max:255',
            'content'    => 'required|string',
        ]);
        $accordion = ProductAccordion::create($validated);
        return response()->json($accordion, 201);
    }

    public function show(ProductAccordion $accordion)
    {
        return response()->json($accordion);
    }

    public function update(Request $request, ProductAccordion $accordion)
    {
        $validated = $request->validate([
            'title'   => 'sometimes|required|string|max:255',
            'content' => 'sometimes|required|string',
        ]);
        $accordion->update($validated);
        return response()->json($accordion);
    }

    public function destroy(ProductAccordion $accordion)
    {
        $accordion->delete();
        return response()->json(null, 204);
    }
}
