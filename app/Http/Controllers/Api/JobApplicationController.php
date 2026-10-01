<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobApplication;
use App\Models\JobOffer;
use Illuminate\Http\Request;

class JobApplicationController extends Controller
{
    /**
     * POST /api/v1/job-applications
     * Reçoit une candidature depuis le front (multipart/form-data pour les fichiers).
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'job_offer_id' => 'nullable|exists:job_offers,id',
            'nom'          => 'required|string|max:255',
            'email'        => 'required|email|max:255',
            'telephone'    => 'nullable|string|max:50',
            'message'      => 'nullable|string',
            'cv'           => 'nullable|file|mimes:pdf,doc,docx|max:5120',
            'lettre'       => 'nullable|file|mimes:pdf,doc,docx|max:5120',
        ]);

        // Stocker le CV
        if ($request->hasFile('cv')) {
            $data['cv_path'] = $request->file('cv')->store('candidatures/cv', 'public');
        }

        // Stocker la lettre de motivation
        if ($request->hasFile('lettre')) {
            $data['lettre_path'] = $request->file('lettre')->store('candidatures/lettres', 'public');
        }

        unset($data['cv'], $data['lettre']);

        $application = JobApplication::create($data);

        return response()->json([
            'message' => 'Candidature enregistrée avec succès.',
            'data'    => $application,
        ], 201);
    }
}
