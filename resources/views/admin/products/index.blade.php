@extends('layouts.app')

@section('title', 'Liste des produits')

@push('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
@endpush

@section('content')
<div class="card">
    <div class="p-6">
        <h4 class="card-title mb-4">Produits</h4>
        <a href="{{ route('admin.products.create') }}" class="btn bg-primary text-white mb-4">Ajouter un produit</a>
        @if(session('success'))
            <div class="bg-success/25 text-success text-sm rounded-md p-4 my-2" role="alert">
                {{ session('success') }}
            </div>
        @endif

        <div class="overflow-x-auto">
            <table id="datatable" class="min-w-full divide-y divide-default-200">
                <thead>
                    <tr>
                        <th class="px-4 py-2 text-left">Image</th>
                        <th class="px-4 py-2 text-left">Nom</th>
                        <th class="px-4 py-2 text-left">Famille</th>
                        <th class="px-4 py-2 text-left">Catégorie</th>
                        <th class="px-4 py-2 text-left">Sous-catégorie</th>
                        <th class="px-4 py-2 text-left">Badge</th>
                        <th class="px-4 py-2 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($products as $product)
                    <tr class="odd:bg-white even:bg-default-100">
                        <td class="px-4 py-2">
                            @if($product->image)
                            <img src="{{ asset($product->image) }}"
                                style="width: 100px; height: 100px; object-fit: contain; border-radius: 8px;">
                            @endif
                        </td>                        
                        <td class="px-4 py-2">{{ $product->name }}</td>
                        <td class="px-4 py-2">
                            <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded">
                                {{ $product->subcategory->category->family->name ?? '' }}
                            </span>
                        </td>
                        <td class="px-4 py-2">
                            <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">
                                {{ $product->subcategory->category->name ?? '' }}
                            </span>
                        </td>
                        <td class="px-4 py-2">
                            <span class="bg-orange-100 text-orange-800 text-xs px-2 py-1 rounded">
                                {{ $product->subcategory->name ?? '' }}
                            </span>
                        </td>
                        <td class="px-4 py-2">
                            @if($product->badge === 'nouveau')
                                <span class="bg-red-100 text-red-700 text-xs font-bold px-2 py-1 rounded-full">🆕 Nouveau</span>
                            @elseif($product->badge === 'premium')
                                <span class="bg-yellow-100 text-yellow-700 text-xs font-bold px-2 py-1 rounded-full">⭐ Premium</span>
                            @else
                                <span class="text-gray-400 text-xs">—</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 flex flex-col gap-2">
                            <a href="{{ route('admin.products.edit', $product) }}" class="btn bg-info text-white">Modifier</a>
                            <form action="{{ route('admin.products.destroy', $product) }}" method="POST" onsubmit="return confirm('Supprimer ce produit ?')">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn bg-red-600 text-white">Supprimer</button>
                            </form>
                            <a href="{{ route('admin.products.analytics.index', $product) }}" class="btn bg-success text-white">Valeurs analytiques</a>
                            <a href="{{ route('admin.products.accordions.index', $product) }}" class="btn bg-secondary text-white">Accordéons / FAQ</a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

{{-- DataTables search --}}
@push('js')
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {
    $('#datatable').DataTable({
        language: { url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/fr-FR.json' },
        columnDefs: [{ targets: -1, orderable: false }],
        pageLength: 25,
    });
});
</script>
@endpush