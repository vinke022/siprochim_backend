<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobOffer;
use Illuminate\Http\Request;

class JobOfferAdminController extends Controller
{
    public function index()
    {
        $offers = JobOffer::orderByDesc('date_publication')->get();
        return view('admin.job-offers.index', compact('offers'));
    }

    public function create()
    {
        return view('admin.job-offers.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'poste'            => 'required|string|max:255',
            'lieu'             => 'required|string|max:255',
            'type'             => 'required|string|max:50',
            'description'      => 'required|string',
            'missions'         => 'nullable|string',
            'profil'           => 'nullable|string',
            'avantages'        => 'nullable|string',
            'date_publication' => 'required|date',
            'active'           => 'boolean',
        ]);

        $data['missions']  = $this->linesToArray($request->missions);
        $data['profil']    = $this->linesToArray($request->profil);
        $data['avantages'] = $this->linesToArray($request->avantages);
        $data['active']    = $request->has('active');

        // Auto-slug
        $base = \Illuminate\Support\Str::slug($data['poste']);
        $slug = $base;
        $i = 1;
        while (JobOffer::where('slug', $slug)->exists()) {
            $slug = $base . '-' . $i++;
        }
        $data['slug'] = $slug;

        JobOffer::create($data);

        return redirect()->route('admin.job-offers.index')
            ->with('success', 'Offre créée avec succès.');
    }

    public function edit(JobOffer $jobOffer)
    {
        return view('admin.job-offers.create', ['offer' => $jobOffer]);
    }

    public function update(Request $request, JobOffer $jobOffer)
    {
        $data = $request->validate([
            'poste'            => 'required|string|max:255',
            'lieu'             => 'required|string|max:255',
            'type'             => 'required|string|max:50',
            'description'      => 'required|string',
            'missions'         => 'nullable|string',
            'profil'           => 'nullable|string',
            'avantages'        => 'nullable|string',
            'date_publication' => 'required|date',
            'active'           => 'boolean',
        ]);

        $data['missions']  = $this->linesToArray($request->missions);
        $data['profil']    = $this->linesToArray($request->profil);
        $data['avantages'] = $this->linesToArray($request->avantages);
        $data['active']    = $request->has('active');

        $jobOffer->update($data);

        return redirect()->route('admin.job-offers.index')
            ->with('success', 'Offre mise à jour avec succès.');
    }

    public function destroy(JobOffer $jobOffer)
    {
        $jobOffer->delete();
        return back()->with('success', 'Offre supprimée.');
    }

    /** Convertit un textarea (une ligne = un élément) en tableau JSON */
    private function linesToArray(?string $text): array
    {
        if (!$text) return [];
        return array_values(array_filter(array_map('trim', explode("\n", $text))));
    }
}
