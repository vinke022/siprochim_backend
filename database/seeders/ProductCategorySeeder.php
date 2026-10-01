<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ProductCategory;
use App\Models\ProductFamily;
use Illuminate\Support\Str;

class ProductCategorySeeder extends Seeder
{
    public function run(): void
    {
        // Obtenir les familles existantes
        $alimentaire = ProductFamily::where('name', 'Alimentaire')->first();
        $detergent = ProductFamily::where('name', 'Détergent')->first();
        $cosmetique = ProductFamily::where('name', 'Cosmétique')->first();

        $categories = [
            // Famille Alimentaire
            [
                'product_family_id' => $alimentaire?->id ?? 1,
                'name' => 'Aromate',
                'slug' => Str::slug('Aromate'),
                'description' => 'Épices et aromates pour la cuisine',
            ],
            [
                'product_family_id' => $alimentaire?->id ?? 1,
                'name' => 'Conserve',
                'slug' => Str::slug('Conserve'),
                'description' => 'Produits en conserve',
            ],
            [
                'product_family_id' => $alimentaire?->id ?? 1,
                'name' => 'Condiment',
                'slug' => Str::slug('Condiment'),
                'description' => 'Sauces et condiments',
            ],
            
            // Famille Détergent
            [
                'product_family_id' => $detergent?->id ?? 2,
                'name' => 'Nettoyant',
                'slug' => Str::slug('Nettoyant'),
                'description' => 'Produits de nettoyage général',
            ],
            [
                'product_family_id' => $detergent?->id ?? 2,
                'name' => 'Désinfectant',
                'slug' => Str::slug('Désinfectant'),
                'description' => 'Produits désinfectants',
            ],
            
            // Famille Cosmétique
            [
                'product_family_id' => $cosmetique?->id ?? 3,
                'name' => 'Soin du corps',
                'slug' => Str::slug('Soin du corps'),
                'description' => 'Produits de soin corporel',
            ],
            [
                'product_family_id' => $cosmetique?->id ?? 3,
                'name' => 'Soin du visage',
                'slug' => Str::slug('Soin du visage'),
                'description' => 'Produits de soin facial',
            ],
        ];

        foreach ($categories as $category) {
            ProductCategory::create($category);
        }
    }
}
