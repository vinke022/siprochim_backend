<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ProductSubcategory;
use App\Models\ProductCategory;
use Illuminate\Support\Str;

class ProductSubcategorySeeder extends Seeder
{
    public function run(): void
    {
        // Obtenir les catégories existantes
        $aromate = ProductCategory::where('name', 'Aromate')->first();
        $conserve = ProductCategory::where('name', 'Conserve')->first();
        $condiment = ProductCategory::where('name', 'Condiment')->first();
        $nettoyant = ProductCategory::where('name', 'Nettoyant')->first();
        $desinfectant = ProductCategory::where('name', 'Désinfectant')->first();
        $soinCorps = ProductCategory::where('name', 'Soin du corps')->first();
        $soinVisage = ProductCategory::where('name', 'Soin du visage')->first();

        $subcategories = [
            // Aromate
            [
                'product_category_id' => $aromate?->id ?? 1,
                'name' => 'Mayonnaise',
                'slug' => Str::slug('Mayonnaise'),
                'description' => 'Mayonnaises et sauces similaires',
            ],
            [
                'product_category_id' => $aromate?->id ?? 1,
                'name' => 'Épices',
                'slug' => Str::slug('Épices'),
                'description' => 'Épices en poudre et graines',
            ],
            [
                'product_category_id' => $aromate?->id ?? 1,
                'name' => 'Herbes',
                'slug' => Str::slug('Herbes'),
                'description' => 'Herbes aromatiques',
            ],
            
            // Conserve
            [
                'product_category_id' => $conserve?->id ?? 2,
                'name' => 'Légumes',
                'slug' => Str::slug('Légumes'),
                'description' => 'Légumes en conserve',
            ],
            [
                'product_category_id' => $conserve?->id ?? 2,
                'name' => 'Fruits',
                'slug' => Str::slug('Fruits'),
                'description' => 'Fruits en conserve',
            ],
            
            // Condiment
            [
                'product_category_id' => $condiment?->id ?? 3,
                'name' => 'Sauce',
                'slug' => Str::slug('Sauce'),
                'description' => 'Sauces diverses',
            ],
            [
                'product_category_id' => $condiment?->id ?? 3,
                'name' => 'Vinaigre',
                'slug' => Str::slug('Vinaigre'),
                'description' => 'Vinaigres et assaisonnements',
            ],
            
            // Nettoyant
            [
                'product_category_id' => $nettoyant?->id ?? 4,
                'name' => 'Multi-surface',
                'slug' => Str::slug('Multi-surface'),
                'description' => 'Nettoyants multi-surfaces',
            ],
            [
                'product_category_id' => $nettoyant?->id ?? 4,
                'name' => 'Sol',
                'slug' => Str::slug('Sol'),
                'description' => 'Nettoyants pour sols',
            ],
            
            // Désinfectant
            [
                'product_category_id' => $desinfectant?->id ?? 5,
                'name' => 'Gel hydroalcoolique',
                'slug' => Str::slug('Gel hydroalcoolique'),
                'description' => 'Gels désinfectants pour les mains',
            ],
            [
                'product_category_id' => $desinfectant?->id ?? 5,
                'name' => 'Spray désinfectant',
                'slug' => Str::slug('Spray désinfectant'),
                'description' => 'Sprays désinfectants',
            ],
            
            // Soin du corps
            [
                'product_category_id' => $soinCorps?->id ?? 6,
                'name' => 'Crème corporelle',
                'slug' => Str::slug('Crème corporelle'),
                'description' => 'Crèmes pour le corps',
            ],
            [
                'product_category_id' => $soinCorps?->id ?? 6,
                'name' => 'Gel douche',
                'slug' => Str::slug('Gel douche'),
                'description' => 'Gels douche et savons liquides',
            ],
            
            // Soin du visage
            [
                'product_category_id' => $soinVisage?->id ?? 7,
                'name' => 'Crème visage',
                'slug' => Str::slug('Crème visage'),
                'description' => 'Crèmes pour le visage',
            ],
            [
                'product_category_id' => $soinVisage?->id ?? 7,
                'name' => 'Nettoyant visage',
                'slug' => Str::slug('Nettoyant visage'),
                'description' => 'Nettoyants pour le visage',
            ],
        ];

        foreach ($subcategories as $subcategory) {
            ProductSubcategory::create($subcategory);
        }
    }
}
