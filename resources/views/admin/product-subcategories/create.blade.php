@extends('layouts.app')

@section('title', 'Sous-catégories de produits')

@section('content')
    <div class="card max-w-lg mx-auto">
        <div class="p-6">
            <h4 class="card-title mb-4">
                {{ isset($productSubcategory) ? 'Modifier la sous-catégorie' : 'Ajouter une sous-catégorie' }}
            </h4>

            <form action="{{ isset($productSubcategory) ? route('admin.product-subcategories.update', $productSubcategory) : route('admin.product-subcategories.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @if(isset($productSubcategory))
                    @method('PUT')
                @endif

                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Catégorie</label>
                    <select name="product_category_id" class="form-input" required>
                        <option value="">-- Sélectionner une catégorie --</option>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}" {{ old('product_category_id', $productSubcategory->product_category_id ?? '') == $category->id ? 'selected' : '' }}>
                                {{ $category->family->name }} → {{ $category->name }}
                            </option>
                        @endforeach
                    </select>
                    @error('product_category_id')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Nom de la sous-catégorie</label>
                    <input type="text" name="name" class="form-input" value="{{ old('name', $productSubcategory->name ?? '') }}" required>
                    @error('name')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Description</label>
                    <textarea name="description" class="form-input" rows="3">{{ old('description', $productSubcategory->description ?? '') }}</textarea>
                    @error('description')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Image</label>
                    <input type="file" name="image" class="form-input">
                    @if(isset($productSubcategory) && $productSubcategory->image)
                        <img src="{{ asset($productSubcategory->image) }}" alt="image" style="max-width: 100px; max-height: 100px; margin-top: 10px; object-fit: cover;">
                    @endif
                    @error('image')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <button type="submit" class="btn bg-primary text-white">
                    {{ isset($productSubcategory) ? 'Mettre à jour' : 'Ajouter' }}
                </button>
            </form>
        </div>
    </div>
@endsection
