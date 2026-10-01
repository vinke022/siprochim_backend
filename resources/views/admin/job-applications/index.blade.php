@extends('layouts.app')

@section('title', 'Candidatures reçues')

@push('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
@endpush

@section('content')
<div class="card">
    <div class="p-6">
        <h4 class="card-title mb-4">Candidatures reçues</h4>

        @if(session('success'))
            <div class="bg-success/25 text-success text-sm rounded-md p-4 my-2" role="alert">
                {{ session('success') }}
            </div>
        @endif

        <div class="overflow-x-auto">
            <table id="datatable" class="min-w-full divide-y divide-default-200">
                <thead>
                    <tr>
                        <th class="px-4 py-2 text-left">Candidat</th>
                        <th class="px-4 py-2 text-left">Email</th>
                        <th class="px-4 py-2 text-left">Poste</th>
                        <th class="px-4 py-2 text-left">Date</th>
                        <th class="px-4 py-2 text-left">Statut</th>
                        <th class="px-4 py-2 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                @forelse($applications as $app)
                    <tr class="odd:bg-white even:bg-default-100">
                        <td class="px-4 py-2 font-medium">{{ $app->nom }}</td>
                        <td class="px-4 py-2 text-sm">{{ $app->email }}</td>
                        <td class="px-4 py-2 text-sm">
                            {{ $app->offer?->poste ?? '—' }}
                        </td>
                        <td class="px-4 py-2 text-sm text-gray-600">
                            {{ $app->created_at->format('d/m/Y') }}
                        </td>
                        <td class="px-4 py-2">
                            @switch($app->statut)
                                @case('nouvelle')
                                    <span class="bg-blue-100 text-blue-800 text-xs font-bold px-2 py-1 rounded-full">🆕 Nouvelle</span>
                                    @break
                                @case('en_cours')
                                    <span class="bg-yellow-100 text-yellow-800 text-xs font-bold px-2 py-1 rounded-full">🔄 En cours</span>
                                    @break
                                @case('acceptee')
                                    <span class="bg-green-100 text-green-700 text-xs font-bold px-2 py-1 rounded-full">✅ Acceptée</span>
                                    @break
                                @case('refusee')
                                    <span class="bg-red-100 text-red-700 text-xs font-bold px-2 py-1 rounded-full">❌ Refusée</span>
                                    @break
                            @endswitch
                        </td>
                        <td class="px-4 py-2 flex gap-2">
                            <a href="{{ route('admin.job-applications.show', $app) }}"
                               class="btn bg-info text-white text-sm py-1 px-3">Voir</a>
                            <form action="{{ route('admin.job-applications.destroy', $app) }}" method="POST"
                                  onsubmit="return confirm('Supprimer cette candidature ?')">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn bg-red-600 text-white text-sm py-1 px-3">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="6" class="px-4 py-8 text-center text-gray-400 italic">Aucune candidature pour le moment.</td>
                    </tr>
                @endforelse
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
        order: [[3, 'desc']],
    });
});
</script>
@endpush
