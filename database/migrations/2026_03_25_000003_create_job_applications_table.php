<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('job_applications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('job_offer_id')->nullable()->constrained()->nullOnDelete();
            $table->string('nom');
            $table->string('email');
            $table->string('telephone')->nullable();
            $table->text('message')->nullable();          // lettre de motivation
            $table->string('cv_path')->nullable();        // chemin fichier CV
            $table->string('lettre_path')->nullable();    // chemin lettre optionnelle
            $table->enum('statut', ['nouvelle', 'en_cours', 'acceptee', 'refusee'])->default('nouvelle');
            $table->text('notes_rh')->nullable();         // notes internes RH
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('job_applications');
    }
};
