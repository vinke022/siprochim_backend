@extends('layouts.app')

@section('title', 'Familles des produits')


@section('content')
    <div class="card max-w-lg mx-auto">
        <div class="p-6">
            <h4 class="card-title mb-4">
                {{ isset($family) ? 'Modifier la famille' : 'Ajouter une famille' }}
            </h4>

            <form action="{{ isset($family) ? route('admin.families.update', $family) : route('admin.families.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @if(isset($family))
                    @method('PUT')
                @endif
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Nom de la famille</label>
                    <input type="text" name="name" class="form-input" value="{{ old('name', $family->name ?? '') }}" required>
                    @error('name')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <div class="mb-3">
                    <label class="text-default-800 text-sm font-medium inline-block mb-2">Image</label>
                    <input type="file" name="image" class="form-input">
                    @if(isset($family) && $family->image)
                        <img src="{{ asset($family->image) }}" alt="image" style="max-width: 100px; max-height: 100px; margin-top: 10px; object-fit: cover;">
                    @endif
                    @error('image')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
                </div>
                
                <button type="submit" class="btn bg-primary text-white">
                    {{ isset($family) ? 'Mettre à jour' : 'Ajouter' }}
                </button>
            </form>
        </div>
    </div>
@endsection