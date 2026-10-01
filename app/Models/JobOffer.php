<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class JobOffer extends Model
{
    protected $fillable = [
        'slug',
        'poste',
        'lieu',
        'type',
        'description',
        'missions',
        'profil',
        'avantages',
        'date_publication',
        'active',
    ];

    protected $casts = [
        'missions'         => 'array',
        'profil'           => 'array',
        'avantages'        => 'array',
        'date_publication' => 'date',
        'active'           => 'boolean',
    ];

    protected static function booted(): void
    {
        static::creating(function ($model) {
            if (empty($model->slug)) {
                $model->slug = Str::slug($model->poste . '-' . now()->format('Y'));
            }
        });
    }

    public function scopeActive($query)
    {
        return $query->where('active', true);
    }
}
