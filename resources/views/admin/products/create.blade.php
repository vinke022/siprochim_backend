@extends('layouts.app')

@section('title', 'Ajouter / Modifier un produit')

@push('css')
<link
    href="{{ asset('assets/libs/quill/quill.core.css') }}"
    rel="stylesheet"
    type="text/css"
/>
<link
    href="{{ asset('assets/libs/quill/quill.bubble.css') }}"
    rel="stylesheet"
    type="text/css"
/>
<link
    href="{{ asset('assets/libs/quill/quill.snow.css') }}"
    rel="stylesheet"
    type="text/css"
/>
@endpush

@section('content')
<div class="card max-w-lg mx-auto">
    <div class="p-6">
        <h4 class="card-title mb-4">
            {{ isset($product) ? 'Modifier le produit' : 'Ajouter un produit' }}
        </h4>

        <form action="{{ isset($product) ? route('admin.products.update', $product) : route('admin.products.store') }}" method="POST" 
        enctype="multipart/form-data" class="quill-form">
            @csrf
            @if(isset($product))
                @method('PUT')
            @endif

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Famille</label>
                <select name="family_id" id="family_id" class="form-input" required>
                    <option value="">-- Sélectionner une famille --</option>
                    @foreach($families as $family)
                        <option value="{{ $family->id }}"
                            {{ (old('family_id', $product->subcategory->category->family->id ?? '') == $family->id) ? 'selected' : '' }}>
                            {{ $family->name }}
                        </option>
                    @endforeach
                </select>
                @error('family_id')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Catégorie</label>
                <select name="category_id" id="category_id" class="form-input" required>
                    <option value="">-- Sélectionner une catégorie --</option>
                </select>
                @error('category_id')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Sous-catégorie</label>
                <select name="product_subcategory_id" id="subcategory_id" class="form-input" required>
                    <option value="">-- Sélectionner une sous-catégorie --</option>
                </select>
                @error('product_subcategory_id')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Nom du produit</label>
                <input type="text" name="name" class="form-input" value="{{ old('name', $product->name ?? '') }}" required>
                @error('name')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Image</label>
                <input type="file" name="image" class="form-input">
                @if(isset($product) && $product->image)
                    <img src="{{ asset($product->image) }}" alt="image" style="max-width: 100px; max-height: 100px; margin-top: 10px; object-fit: cover;">
                @endif
                @error('image')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Badge</label>
                <select name="badge" class="form-input">
                    <option value="">-- Aucun --</option>
                    <option value="nouveau" {{ old('badge', $product->badge ?? '') === 'nouveau' ? 'selected' : '' }}>🆕 Nouveau</option>
                    <option value="premium" {{ old('badge', $product->badge ?? '') === 'premium' ? 'selected' : '' }}>⭐ Premium</option>
                </select>
                @error('badge')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Description</label>
                <!-- Zone Quill -->
                <div id="text-editor-product" style="height: 300px;">{!! old('description', $product->description ?? '') !!}</div>
                <!-- Champ caché pour envoyer le contenu HTML à Laravel -->
                <input type="hidden" name="description" id="content-input-product">
                @error('description')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <button type="submit" class="btn bg-primary text-white">
                {{ isset($product) ? 'Mettre à jour' : 'Ajouter' }}
            </button>
        </form>
    </div>
</div>
@endsection

@push('js')
<script src="{{ asset('assets/libs/quill/quill.min.js') }}"></script>
<script src="{{ asset('assets/js/pages/form-editor.js') }}"></script>
<script>
    var quill = new Quill('#text-editor-product', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'font': [] }],
                [{ 'size': [] }],
                ['bold', 'italic', 'underline', 'strike'],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'script': 'super' }, { 'script': 'sub' }],
                [{ 'header': 1 }, { 'header': 2 }, 'blockquote', 'code-block'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'align': [] }],
                [{ 'direction': 'rtl' }],
                [{ 'indent': '-1' }, { 'indent': '+1' }],
                ['link', 'image'],
                ['clean']
            ]
        },
        placeholder: 'Rédigez le contenu ici...'
    });

    var form = document.querySelector('.quill-form');
    form.addEventListener('submit', function(e) {
        document.getElementById('content-input-product').value = quill.root.innerHTML;
    });

    // Gestion des sélecteurs dépendants
    function loadCategories(familyId, onLoaded) {
        var categorySelect = document.getElementById('category_id');
        var subcategorySelect = document.getElementById('subcategory_id');
        categorySelect.innerHTML = '<option value="">-- Sélectionner une catégorie --</option>';
        subcategorySelect.innerHTML = '<option value="">-- Sélectionner une sous-catégorie --</option>';
        if (!familyId) { if (onLoaded) onLoaded(); return; }
        fetch(`{{ url('admin/ajax/categories-by-family') }}/${familyId}`)
            .then(r => r.json())
            .then(data => {
                data.forEach(cat => {
                    var opt = document.createElement('option');
                    opt.value = cat.id;
                    opt.textContent = cat.name;
                    categorySelect.appendChild(opt);
                });
                if (onLoaded) onLoaded();
            });
    }

    function loadSubcategories(categoryId, onLoaded) {
        var subcategorySelect = document.getElementById('subcategory_id');
        subcategorySelect.innerHTML = '<option value="">-- Sélectionner une sous-catégorie --</option>';
        if (!categoryId) { if (onLoaded) onLoaded(); return; }
        fetch(`{{ url('admin/ajax/subcategories-by-category') }}/${categoryId}`)
            .then(r => r.json())
            .then(data => {
                data.forEach(sub => {
                    var opt = document.createElement('option');
                    opt.value = sub.id;
                    opt.textContent = sub.name;
                    subcategorySelect.appendChild(opt);
                });
                if (onLoaded) onLoaded();
            });
    }

    document.getElementById('family_id').addEventListener('change', function() {
        loadCategories(this.value, null);
    });

    document.getElementById('category_id').addEventListener('change', function() {
        loadSubcategories(this.value, null);
    });

    // Initialisation pour l'édition : chaîner les fetch pour garantir l'ordre
    @if(isset($product))
        var initialFamilyId = {{ $product->subcategory->category->family->id ?? 'null' }};
        var initialCategoryId = {{ $product->subcategory->category->id ?? 'null' }};
        var initialSubcategoryId = {{ $product->subcategory->id ?? 'null' }};

        if (initialFamilyId) {
            document.getElementById('family_id').value = initialFamilyId;
            loadCategories(initialFamilyId, function() {
                if (initialCategoryId) {
                    document.getElementById('category_id').value = initialCategoryId;
                    loadSubcategories(initialCategoryId, function() {
                        if (initialSubcategoryId) {
                            document.getElementById('subcategory_id').value = initialSubcategoryId;
                        }
                    });
                }
            });
        }
    @endif
</script>
@endpush