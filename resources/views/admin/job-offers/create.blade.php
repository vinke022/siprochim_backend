@extends('layouts.app')

@section('title', isset($offer) ? 'Modifier l\'offre' : 'Nouvelle offre d\'emploi')

@section('content')
<div class="card max-w-2xl mx-auto">
    <div class="p-6">
        <h4 class="card-title mb-4">
            {{ isset($offer) ? 'Modifier l\'offre' : 'Ajouter une offre d\'emploi' }}
        </h4>

        <form action="{{ isset($offer) ? route('admin.job-offers.update', $offer) : route('admin.job-offers.store') }}"
              method="POST">
            @csrf
            @if(isset($offer))
                @method('PUT')
            @endif

            {{-- Poste --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Intitulé du poste *</label>
                <input type="text" name="poste" class="form-input"
                       value="{{ old('poste', $offer->poste ?? '') }}" required>
                @error('poste')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            {{-- Lieu --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Lieu *</label>
                <input type="text" name="lieu" class="form-input"
                       value="{{ old('lieu', $offer->lieu ?? 'Abidjan') }}" required>
                @error('lieu')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            {{-- Type --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Type de contrat *</label>
                <select name="type" class="form-input" required>
                    @foreach(['CDI', 'CDD', 'Stage', 'Alternance', 'Freelance'] as $t)
                        <option value="{{ $t }}" {{ old('type', $offer->type ?? 'CDI') === $t ? 'selected' : '' }}>
                            {{ $t }}
                        </option>
                    @endforeach
                </select>
                @error('type')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            {{-- Date de publication --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Date de publication *</label>
                <input type="date" name="date_publication" class="form-input"
                       value="{{ old('date_publication', isset($offer) ? $offer->date_publication : date('Y-m-d')) }}" required>
                @error('date_publication')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            {{-- Description --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Description du poste *</label>
                <textarea name="description" rows="4" class="form-input"
                          required>{{ old('description', $offer->description ?? '') }}</textarea>
                @error('description')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            {{-- Missions --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">
                    Missions <span class="text-gray-400 font-normal text-xs">(une par ligne)</span>
                </label>
                <textarea name="missions" rows="5" class="form-input font-mono text-sm"
                          placeholder="Définir la politique qualité&#10;Superviser les audits&#10;...">{{ old('missions', isset($offer) ? implode("\n", $offer->missions ?? []) : '') }}</textarea>
            </div>

            {{-- Profil --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">
                    Profil recherché <span class="text-gray-400 font-normal text-xs">(une par ligne)</span>
                </label>
                <textarea name="profil" rows="5" class="form-input font-mono text-sm"
                          placeholder="Bac+5 en Qualité&#10;5 ans d'expérience&#10;...">{{ old('profil', isset($offer) ? implode("\n", $offer->profil ?? []) : '') }}</textarea>
            </div>

            {{-- Avantages --}}
            <div class="mb-4">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">
                    Ce que nous offrons <span class="text-gray-400 font-normal text-xs">(une par ligne)</span>
                </label>
                <textarea name="avantages" rows="4" class="form-input font-mono text-sm"
                          placeholder="Salaire attractif&#10;Assurance santé&#10;...">{{ old('avantages', isset($offer) ? implode("\n", $offer->avantages ?? []) : '') }}</textarea>
            </div>

            {{-- Statut actif --}}
            <div class="mb-6">
                <label class="inline-flex items-center gap-2 cursor-pointer">
                    <input type="checkbox" name="active" value="1" class="w-4 h-4"
                           {{ old('active', $offer->active ?? true) ? 'checked' : '' }}>
                    <span class="text-sm font-medium text-default-800">Offre visible sur le site</span>
                </label>
            </div>

            <div class="flex gap-3">
                <button type="submit" class="btn bg-primary text-white">
                    {{ isset($offer) ? 'Mettre à jour' : 'Publier l\'offre' }}
                </button>
                <a href="{{ route('admin.job-offers.index') }}" class="btn bg-default-200 text-default-700">
                    Annuler
                </a>
            </div>
        </form>
    </div>
</div>
@endsection
