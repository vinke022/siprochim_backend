<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Vérifie que la table n'existe pas déjà (sécurité)
        if (!Schema::hasTable('products')) {
            Schema::create('products', function (Blueprint $table) {
                $table->id();
                $table->foreignId('product_family_id')->constrained()->onDelete('cascade');
                $table->string('name');
                $table->string('slug')->unique();
                $table->string('image')->nullable();
                $table->text('description')->nullable();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        // Sécurité : on ne drop que si la table existe
        if (Schema::hasTable('products')) {
            Schema::dropIfExists('products');
        }
    }
};
