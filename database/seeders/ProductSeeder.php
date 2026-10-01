<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductSubcategory;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    public function run()
    {
        // Obtenir les sous-catégories existantes
        $mayonnaise = ProductSubcategory::where('name', 'Mayonnaise')->first();
        $epices = ProductSubcategory::where('name', 'Épices')->first();
        $herbes = ProductSubcategory::where('name', 'Herbes')->first();
        $legumes = ProductSubcategory::where('name', 'Légumes')->first();
        $fruits = ProductSubcategory::where('name', 'Fruits')->first();
        $sauce = ProductSubcategory::where('name', 'Sauce')->first();
        $multiSurface = ProductSubcategory::where('name', 'Multi-surface')->first();
        $sol = ProductSubcategory::where('name', 'Sol')->first();
        $gelHydroalcoolique = ProductSubcategory::where('name', 'Gel hydroalcoolique')->first();
        $sprayDesinfectant = ProductSubcategory::where('name', 'Spray désinfectant')->first();
        $cremeCorps = ProductSubcategory::where('name', 'Crème corporelle')->first();
        $gelDouche = ProductSubcategory::where('name', 'Gel douche')->first();

        $products = [
            // Mayonnaise
            [
                'product_subcategory_id' => $mayonnaise?->id ?? 1,
                'name' => 'Mayonnaise Classique',
                'slug' => Str::slug('Mayonnaise Classique'),
                'description' => 'Mayonnaise traditionnelle aux œufs frais',
            ],
            [
                'product_subcategory_id' => $mayonnaise?->id ?? 1,
                'name' => 'Mayonnaise Allégée',
                'slug' => Str::slug('Mayonnaise Allégée'),
                'description' => 'Mayonnaise allégée en matières grasses',
            ],
            
            // Épices
            [
                'product_subcategory_id' => $epices?->id ?? 2,
                'name' => 'Paprika Doux',
                'slug' => Str::slug('Paprika Doux'),
                'description' => 'Épice de paprika doux en poudre',
            ],
            [
                'product_subcategory_id' => $epices?->id ?? 2,
                'name' => 'Cumin Moulu',
                'slug' => Str::slug('Cumin Moulu'),
                'description' => 'Cumin moulu pour assaisonnement',
            ],
            
            // Herbes
            [
                'product_subcategory_id' => $herbes?->id ?? 3,
                'name' => 'Basilic Séché',
                'slug' => Str::slug('Basilic Séché'),
                'description' => 'Basilic séché pour cuisine méditerranéenne',
            ],
            [
                'product_subcategory_id' => $herbes?->id ?? 3,
                'name' => 'Thym Provençal',
                'slug' => Str::slug('Thym Provençal'),
                'description' => 'Thym de Provence séché',
            ],
            
            // Nettoyants
            [
                'product_subcategory_id' => $multiSurface?->id ?? 8,
                'name' => 'Super Poudre Clean',
                'slug' => Str::slug('Super Poudre Clean'),
                'description' => 'Nettoyant multi-surfaces en poudre',
            ],
            [
                'product_subcategory_id' => $sol?->id ?? 9,
                'name' => 'Nettoyant Sols Fraîcheur',
                'slug' => Str::slug('Nettoyant Sols Fraîcheur'),
                'description' => 'Nettoyant spécial sols avec fraîcheur',
            ],
            
            // Désinfectants
            [
                'product_subcategory_id' => $gelHydroalcoolique?->id ?? 11,
                'name' => 'Gel Hydroalcoolique 75%',
                'slug' => Str::slug('Gel Hydroalcoolique 75%'),
                'description' => 'Gel désinfectant pour les mains',
            ],
            [
                'product_subcategory_id' => $sprayDesinfectant?->id ?? 12,
                'name' => 'Spray Désinfectant Multi-usage',
                'slug' => Str::slug('Spray Désinfectant Multi-usage'),
                'description' => 'Spray désinfectant pour toutes surfaces',
            ],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}
