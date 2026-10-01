@extends('layouts.app')

@section('title', 'Ajouter / Modifier la valeur analytique')

@section('content')
<div class="card max-w-lg mx-auto">
    <div class="p-6">
        <h4 class="card-title mb-4">
            {{ isset($analytic) ? 'Modifier la valeur analytique' : 'Ajouter une valeur analytique' }}
        </h4>
        <form action="{{ isset($analytic) 
            ? route('admin.products.analytics.update', [$product, $analytic]) 
            : route('admin.products.analytics.store', $product) 
        }}" method="POST">
            @csrf
            @if(isset($analytic))
                @method('PUT')
            @endif

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Label</label>
                <input type="text" name="label" class="form-input" value="{{ old('label', $analytic->label ?? '') }}" required>
                @error('label')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>
            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Valeur</label>
                <input type="text" name="value" class="form-input" value="{{ old('value', $analytic->value ?? '') }}" required>
                @error('value')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>
            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Unité</label>
                <input type="text" name="unit" class="form-input" value="{{ old('unit', $analytic->unit ?? '') }}" required>
                @error('unit')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>
            <button type="submit" class="btn bg-primary text-white">
                {{ isset($analytic) ? 'Mettre à jour' : 'Ajouter' }}
            </button>
        </form>
    </div>
</div>
@endsection