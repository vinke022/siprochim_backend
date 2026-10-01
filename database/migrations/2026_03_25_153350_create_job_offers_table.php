<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // La table job_offers a déjà été créée par 2026_03_25_000001_create_job_offers_table.php
        // Ce fichier est un doublon généré par artisan — on ne fait rien pour ne pas écraser les données.
        if (!Schema::hasTable('job_offers')) {
            Schema::create('job_offers', function (Blueprint $table) {
                $table->id();
                $table->timestamps();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('job_offers');
    }
};
