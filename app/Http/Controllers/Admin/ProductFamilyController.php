<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProductFamily;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProductFamilyController extends Controller
{
    public function index()
    {
        $families = ProductFamily::withCount(['categories', 'subcategories'])->latest()->paginate(10);
        return view('admin.families.index', compact('families'));
    }

    public function create()
    {
        return view('admin.families.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|max:2048',
        ]);
        
        $data['slug'] = Str::slug($data['name']);
        
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('product_families'), $filename);
            $data['image'] = 'product_families/' . $filename;
        }
        
        ProductFamily::create($data);
        return redirect()->route('admin.families.index')->with('success', 'Famille créée avec succès.');
    }

    public function edit(ProductFamily $family)
    {
        return view('admin.families.create', compact('family'));
    }

    public function update(Request $request, ProductFamily $family)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|max:2048',
        ]);
        
        $data['slug'] = Str::slug($data['name']);
        
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('product_families'), $filename);
            $data['image'] = 'product_families/' . $filename;
        }
        
        $family->update($data);
        return redirect()->route('admin.families.index')->with('success', 'Famille mise à jour avec succès.');
    }

    public function destroy(ProductFamily $family)
    {
        $family->delete();
        return back()->with('success', 'Famille supprimée avec succès.');
    }
}
