<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('job_offers', function (Blueprint $table) {
            $table->id();
            $table->string('slug')->unique();
            $table->string('poste');
            $table->string('lieu')->default('Abidjan');
            $table->string('type')->default('CDI'); // CDI, CDD, Stage, Alternance
            $table->text('description');
            $table->json('missions')->nullable();
            $table->json('profil')->nullable();
            $table->json('avantages')->nullable();
            $table->date('date_publication')->useCurrent();
            $table->boolean('active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('job_offers');
    }
};
