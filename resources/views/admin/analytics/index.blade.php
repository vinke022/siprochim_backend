@extends('layouts.app')

@section('title', 'Valeurs analytiques pour ' . $product->name)

@push('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
@endpush

@section('content')
<div class="card">
    <div class="p-6">
        <h4 class="card-title mb-4">Valeurs analytiques pour {{ $product->name }}</h4>
        <a href="{{ route('admin.products.analytics.create', $product) }}" class="btn bg-primary text-white mb-4">Ajouter une valeur analytique</a>
        @if(session('success'))
            <div class="mb-4 rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-green-800">
                {{ session('success') }}
            </div>
        @endif

        <div class="overflow-x-auto">
            <table id="datatable" class="min-w-full divide-y divide-default-200">
                <thead>
                    <tr>
                        <th class="px-4 py-2 text-left">Label</th>
                        <th class="px-4 py-2 text-left">Valeur</th>
                        <th class="px-4 py-2 text-left">Unité</th>
                        <th class="px-4 py-2 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($analytics as $analytic)
                    <tr class="odd:bg-white even:bg-default-100">
                        <td class="px-4 py-2">{{ $analytic->label }}</td>
                        <td class="px-4 py-2">{{ $analytic->value }}</td>
                        <td class="px-4 py-2">{{ $analytic->unit }}</td>
                        <td class="px-4 py-2 flex gap-2">
                            <a href="{{ route('admin.products.analytics.edit', [$product, $analytic]) }}" class="btn bg-info text-white">Modifier</a>
                            <form action="{{ route('admin.products.analytics.destroy', [$product, $analytic]) }}" method="POST" onsubmit="return confirm('Supprimer cette valeur ?')">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn bg-red-600 text-white">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@push('js')
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {
    $('#datatable').DataTable({
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.7/i18n/fr-FR.json"
        },
        columnDefs: [{ targets: -1, orderable: false }]
    });
});
</script>
@endpush