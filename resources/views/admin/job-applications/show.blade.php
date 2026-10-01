@extends('layouts.app')

@section('title', 'Candidature — ' . $jobApplication->nom)

@section('content')
<div class="card">
    <div class="p-6 max-w-3xl">
        <div class="flex items-center justify-between mb-6">
            <h4 class="card-title">Candidature de {{ $jobApplication->nom }}</h4>
            <a href="{{ route('admin.job-applications.index') }}" class="btn bg-default-200 text-sm py-1 px-3">← Retour</a>
        </div>

        @if(session('success'))
            <div class="bg-success/25 text-success text-sm rounded-md p-4 my-3" role="alert">
                {{ session('success') }}
            </div>
        @endif

        {{-- Informations candidat --}}
        <div class="bg-default-50 rounded-lg p-4 mb-6 space-y-2 text-sm">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <span class="text-gray-500">Nom :</span>
                    <span class="font-medium ml-1">{{ $jobApplication->nom }}</span>
                </div>
                <div>
                    <span class="text-gray-500">Email :</span>
                    <a href="mailto:{{ $jobApplication->email }}" class="text-primary ml-1">{{ $jobApplication->email }}</a>
                </div>
                <div>
                    <span class="text-gray-500">Téléphone :</span>
                    <span class="ml-1">{{ $jobApplication->telephone ?? '—' }}</span>
                </div>
                <div>
                    <span class="text-gray-500">Offre visée :</span>
                    <span class="ml-1">{{ $jobApplication->offer?->poste ?? 'Candidature spontanée' }}</span>
                </div>
                <div>
                    <span class="text-gray-500">Reçue le :</span>
                    <span class="ml-1">{{ $jobApplication->created_at->format('d/m/Y à H:i') }}</span>
                </div>
            </div>
        </div>

        {{-- Lettre de motivation --}}
        @if($jobApplication->message)
        <div class="mb-6">
            <h5 class="font-semibold text-sm text-gray-700 mb-2">Lettre de motivation</h5>
            <div class="bg-white border border-default-200 rounded p-4 text-sm whitespace-pre-wrap">{{ $jobApplication->message }}</div>
        </div>
        @endif

        {{-- Pièces jointes --}}
        <div class="mb-6 flex gap-4">
            @if($jobApplication->cv_path)
                <a href="{{ Storage::url($jobApplication->cv_path) }}" target="_blank"
                   class="btn bg-primary text-white text-sm py-2 px-4">
                    📄 Télécharger le CV
                </a>
            @endif
            @if($jobApplication->lettre_path)
                <a href="{{ Storage::url($jobApplication->lettre_path) }}" target="_blank"
                   class="btn bg-info text-white text-sm py-2 px-4">
                    📎 Télécharger la lettre
                </a>
            @endif
        </div>

        {{-- Formulaire statut + notes RH --}}
        <form action="{{ route('admin.job-applications.update', $jobApplication) }}" method="POST"
              class="bg-white border border-default-200 rounded-lg p-4">
            @csrf @method('PUT')

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700 mb-1">Statut</label>
                <select name="statut" class="form-select w-full max-w-xs">
                    <option value="nouvelle"  {{ $jobApplication->statut === 'nouvelle'  ? 'selected' : '' }}>🆕 Nouvelle</option>
                    <option value="en_cours"  {{ $jobApplication->statut === 'en_cours'  ? 'selected' : '' }}>🔄 En cours</option>
                    <option value="acceptee"  {{ $jobApplication->statut === 'acceptee'  ? 'selected' : '' }}>✅ Acceptée</option>
                    <option value="refusee"   {{ $jobApplication->statut === 'refusee'   ? 'selected' : '' }}>❌ Refusée</option>
                </select>
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700 mb-1">Notes RH (internes)</label>
                <textarea name="notes_rh" rows="4"
                          class="form-input w-full text-sm"
                          placeholder="Notes internes, remarques, suivi...">{{ $jobApplication->notes_rh }}</textarea>
            </div>

            <button type="submit" class="btn bg-primary text-white py-2 px-6">Enregistrer</button>
        </form>
    </div>
</div>
@endsection
