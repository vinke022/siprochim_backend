<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // On cherche dynamiquement le nom de la contrainte FK
        $fkName = null;
        $result = DB::select("
            SELECT CONSTRAINT_NAME
            FROM information_schema.KEY_COLUMN_USAGE
            WHERE TABLE_NAME = 'products'
            AND COLUMN_NAME = 'product_family_id'
            AND CONSTRAINT_SCHEMA = DATABASE()
            AND REFERENCED_TABLE_NAME IS NOT NULL
            LIMIT 1
        ");
        if (!empty($result)) {
            $fkName = $result[0]->CONSTRAINT_NAME;
            // Supprimer la contrainte FK par son vrai nom !
            DB::statement("ALTER TABLE products DROP FOREIGN KEY `$fkName`");
        }

        // Supprime la colonne si elle existe
        if (Schema::hasColumn('products', 'product_family_id')) {
            Schema::table('products', function (Blueprint $table) {
                $table->dropColumn('product_family_id');
            });
        }

        // Ajoute la nouvelle clé étrangère si elle n’existe pas déjà
        if (!Schema::hasColumn('products', 'product_subcategory_id')) {
            Schema::table('products', function (Blueprint $table) {
                $table->foreignId('product_subcategory_id')->constrained()->onDelete('cascade');
            });
        }
    }

    public function down(): void
    {
        // Même principe, à sécuriser également si besoin
        if (Schema::hasColumn('products', 'product_subcategory_id')) {
            Schema::table('products', function (Blueprint $table) {
                $table->dropForeign(['product_subcategory_id']);
                $table->dropColumn('product_subcategory_id');
            });
        }
        if (!Schema::hasColumn('products', 'product_family_id')) {
            Schema::table('products', function (Blueprint $table) {
                $table->foreignId('product_family_id')->constrained()->onDelete('cascade');
            });
        }
    }
};
