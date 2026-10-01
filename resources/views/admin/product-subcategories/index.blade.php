@extends('layouts.app')

@section('title', 'Liste des sous-catégories')

@push('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
@endpush

@section('content')

    <div class="card">

        <div class="p-6">

            <h4 class="card-title mb-4">Sous-catégories de produits</h4>

    

            <a href="{{ route('admin.product-subcategories.create') }}" class="btn bg-primary text-white mb-4">Ajouter une sous-catégorie</a>

    

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

                            <th class="px-4 py-2 text-left">Famille</th>

                            <th class="px-4 py-2 text-left">Catégorie</th>

                            <th class="px-4 py-2 text-left">Nom</th>

                            <th class="px-4 py-2 text-left">Slug</th>

                            <th class="px-4 py-2 text-left">Description</th>

                            <th class="px-4 py-2 text-left">Actions</th>

                        </tr>

                    </thead>

                    <tbody>

                    @foreach($subcategories as $subcategory)

                        <tr class="odd:bg-white even:bg-default-100">

                            <td class="px-4 py-2">

                                @if($subcategory->image)

                                    <img src="{{ asset($subcategory->image) }}" alt="image" 

                                        style="width: 60px; height: 60px; object-fit: contain; border-radius: 8px;">

                                @endif

                            </td>

                            <td class="px-4 py-2">
                                @php($family = optional($subcategory->category)->family)
                                @if($family)
                                    <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded">
                                        {{ $family->name }}
                                    </span>
                                @else
                                    <span class="bg-default-200 text-default-600 text-xs px-2 py-1 rounded italic">Aucune famille</span>
                                @endif
                            </td>

                            <td class="px-4 py-2">
                                @if($subcategory->category)
                                    <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">{{ $subcategory->category->name }}</span>
                                @else
                                    <span class="bg-default-200 text-default-600 text-xs px-2 py-1 rounded italic">Aucune catégorie</span>
                                @endif
                            </td>

                            <td class="px-4 py-2">{{ $subcategory->name }}</td>

                            <td class="px-4 py-2">{{ $subcategory->slug }}</td>

                            <td class="px-4 py-2">{{ Str::limit($subcategory->description, 50) }}</td>

                            <td class="px-4 py-2 flex gap-2">

                                <a href="{{ route('admin.product-subcategories.edit', $subcategory) }}" class="btn bg-info text-white">Modifier</a>

                                <form action="{{ route('admin.product-subcategories.destroy', $subcategory) }}" method="POST" onsubmit="return confirm('Supprimer cette sous-catégorie ?')">

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
        language: { url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/fr-FR.json' },
        columnDefs: [{ targets: -1, orderable: false }],
        pageLength: 25,
    });
});
</script>
@endpush
