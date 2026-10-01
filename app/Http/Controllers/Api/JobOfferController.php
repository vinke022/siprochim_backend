<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobOffer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class JobOfferController extends Controller
{
    /**
     * GET /api/v1/job-offers
     * Retourne toutes les offres actives, triées par date de publication desc.
     */
    public function index(): JsonResponse
    {
        $offers = JobOffer::active()
            ->orderByDesc('date_publication')
            ->get();

        return response()->json([
            'data'  => $offers,
            'total' => $offers->count(),
        ]);
    }

    /**
     * GET /api/v1/job-offers/{slug}
     * Retourne une offre par son slug.
     */
    public function show(string $slug): JsonResponse
    {
        $offer = JobOffer::active()->where('slug', $slug)->first();

        if (!$offer) {
            return response()->json(['message' => 'Offre non trouvée'], 404);
        }

        return response()->json(['data' => $offer]);
    }

    /**
     * POST /api/v1/job-offers  (admin – à protéger avec middleware auth:sanctum si besoin)
     */
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'poste'            => 'required|string|max:255',
            'lieu'             => 'nullable|string|max:255',
            'type'             => 'nullable|string|max:100',
            'description'      => 'required|string',
            'missions'         => 'nullable|array',
            'profil'           => 'nullable|array',
            'avantages'        => 'nullable|array',
            'date_publication' => 'nullable|date',
            'active'           => 'nullable|boolean',
        ]);

        $validated['slug'] = Str::slug($validated['poste'] . '-' . now()->format('Y'));

        $offer = JobOffer::create($validated);

        return response()->json(['data' => $offer], 201);
    }

    /**
     * PUT /api/v1/job-offers/{slug}
     */
    public function update(Request $request, string $slug): JsonResponse
    {
        $offer = JobOffer::where('slug', $slug)->firstOrFail();

        $validated = $request->validate([
            'poste'            => 'sometimes|string|max:255',
            'lieu'             => 'sometimes|string|max:255',
            'type'             => 'sometimes|string|max:100',
            'description'      => 'sometimes|string',
            'missions'         => 'sometimes|array',
            'profil'           => 'sometimes|array',
            'avantages'        => 'sometimes|array',
            'date_publication' => 'sometimes|date',
            'active'           => 'sometimes|boolean',
        ]);

        $offer->update($validated);

        return response()->json(['data' => $offer]);
    }

    /**
     * DELETE /api/v1/job-offers/{slug}  (soft-disable)
     */
    public function destroy(string $slug): JsonResponse
    {
        $offer = JobOffer::where('slug', $slug)->firstOrFail();
        $offer->update(['active' => false]);

        return response()->json(['message' => 'Offre désactivée']);
    }
}
