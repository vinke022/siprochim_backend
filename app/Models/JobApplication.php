<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JobApplication extends Model
{
    protected $fillable = [
        'job_offer_id',
        'nom',
        'email',
        'telephone',
        'message',
        'cv_path',
        'lettre_path',
        'statut',
        'notes_rh',
    ];

    public function offer()
    {
        return $this->belongsTo(JobOffer::class, 'job_offer_id');
    }
}
