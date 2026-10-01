@extends('layouts.app')

@section('title', 'Catégories de produits')

@section('content')
    <div class="card max-w-lg mx-auto">
        <div class="p-6">
            <h4 class="card-title mb-4">
                {{ isset($productCategory) ? 'Modifier la catégorie' : 'Ajouter une catégorie' }}
            </h4>

            <form action="{{ isset($productCategory) ? route('admin.product-categories.update', $productCategory) : route('admin.product-categories.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @if(isset($productCategory))
                    @method('PUT')
                @endif

                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Famille</label>
                    <select name="product_family_id" class="form-input" required>
                        <option value="">-- Sélectionner une famille --</option>
                        @foreach($families as $family)
                            <option value="{{ $family->id }}" {{ old('product_family_id', $productCategory->product_family_id ?? '') == $family->id ? 'selected' : '' }}>
                                {{ $family->name }}
                            </option>
                        @endforeach
                    </select>
                    @error('product_family_id')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Nom de la catégorie</label>
                    <input type="text" name="name" class="form-input" value="{{ old('name', $productCategory->name ?? '') }}" required>
                    @error('name')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Description</label>
                    <textarea name="description" class="form-input" rows="3">{{ old('description', $productCategory->description ?? '') }}</textarea>
                    @error('description')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Image</label>
                    <input type="file" name="image" class="form-input">
                    @if(isset($productCategory) && $productCategory->image)
                        <img src="{{ asset($productCategory->image) }}" alt="image" style="max-width: 100px; max-height: 100px; margin-top: 10px; object-fit: cover;">
                    @endif
                    @error('image')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <button type="submit" class="btn bg-primary text-white">
                    {{ isset($productCategory) ? 'Mettre à jour' : 'Ajouter' }}
                </button>
            </form>
        </div>
    </div>
@endsection
