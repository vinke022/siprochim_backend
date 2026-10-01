<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductAccordion;
use Illuminate\Http\Request;

class ProductAccordionController extends Controller
{
    public function index(Product $product)
    {
        $accordions = $product->accordions;
        return view('admin.accordions.index', compact('product','accordions'));
    }

    public function create(Product $product)
    {
        return view('admin.accordions.create', compact('product'));
    }

    public function store(Request $request, Product $product)
    {
        $data = $request->validate([
            'title' => 'required|string',
            'content' => 'nullable|string',
        ]);
        $data['product_id'] = $product->id;
        ProductAccordion::create($data);
        return redirect()->route('admin.products.accordions.index', $product)->with('success', 'Accordéon ajouté.');
    }

    public function edit(Product $product, ProductAccordion $accordion)
    {
        return view('admin.accordions.create', compact('product', 'accordion'));
    }

    public function update(Request $request, Product $product, ProductAccordion $accordion)
    {
        $data = $request->validate([
            'title' => 'required|string',
            'content' => 'nullable|string',
        ]);
        $accordion->update($data);
        return redirect()->route('admin.products.accordions.index', $product)->with('success', 'Accordéon modifié.');
    }

    public function destroy(Product $product, ProductAccordion $accordion)
    {
        $accordion->delete();
        return back()->with('success', 'Accordéon supprimé.');
    }
}

