<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobApplication;
use Illuminate\Http\Request;

class JobApplicationAdminController extends Controller
{
    public function index()
    {
        $applications = JobApplication::with('offer')->latest()->get();
        return view('admin.job-applications.index', compact('applications'));
    }

    public function show(JobApplication $jobApplication)
    {
        $jobApplication->load('offer');
        return view('admin.job-applications.show', compact('jobApplication'));
    }

    public function update(Request $request, JobApplication $jobApplication)
    {
        $validated = $request->validate([
            'statut'   => 'required|in:nouvelle,en_cours,acceptee,refusee',
            'notes_rh' => 'nullable|string',
        ]);

        $jobApplication->update($validated);

        return redirect()
            ->route('admin.job-applications.show', $jobApplication)
            ->with('success', 'Candidature mise à jour.');
    }

    public function destroy(JobApplication $jobApplication)
    {
        // Delete uploaded files if they exist
        if ($jobApplication->cv_path) {
            \Storage::disk('public')->delete($jobApplication->cv_path);
        }
        if ($jobApplication->lettre_path) {
            \Storage::disk('public')->delete($jobApplication->lettre_path);
        }

        $jobApplication->delete();

        return redirect()
            ->route('admin.job-applications.index')
            ->with('success', 'Candidature supprimée.');
    }
}
