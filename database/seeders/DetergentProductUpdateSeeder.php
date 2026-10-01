<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductSubcategory;
use App\Models\ProductCategory;

/**
 * Met à jour la gamme Détergent :
 *  1. Désodorisant : ajoute formats 1L et 4L (par couleur)
 *  2. Zen Breeze   : ajoute produits dans la sous-catégorie véhicule
 *
 * Exécuter avec :
 *   php artisan db:seed --class=DetergentProductUpdateSeeder
 */
class DetergentProductUpdateSeeder extends Seeder
{
    public function run(): void
    {
        // =====================================================
        // 1. DÉSODORISANT : ajouter 1L et 4L (triés par couleur : citron d'abord)
        //    Sous-catégorie désodorisant NIL = ID 37
        // =====================================================
        $desodSubcatId = 37;

        // Vérifier que la sous-catégorie existe, sinon chercher par slug/name
        $desodSubcat = ProductSubcategory::find($desodSubcatId);
        if (!$desodSubcat) {
            $desodSubcat = ProductSubcategory::where('slug', 'like', '%desod%')
                ->orWhere('name', 'like', '%D%sodor%')
                ->first();
            if ($desodSubcat) {
                $desodSubcatId = $desodSubcat->id;
                $this->command->info("  ✔ Sous-catégorie désodorisant trouvée (ID $desodSubcatId)");
            } else {
                $this->command->warn('  ⚠ Sous-catégorie désodorisant introuvable – ignorer section 1');
                $desodSubcatId = null;
            }
        }

        if ($desodSubcatId) {
            $desodProducts = [
                // Citron en 1L et 4L (priorité citron)
                [
                    'slug'                   => 'nil-desodorisant-citron-1l',
                    'name'                   => 'NIL Désodorisant Citron 1L',
                    'description'            => 'Désodorisant textile NIL senteur Citron – flacon 1L',
                    'product_subcategory_id' => $desodSubcatId,
                    'image'                  => null,
                ],
                [
                    'slug'                   => 'nil-desodorisant-citron-4l',
                    'name'                   => 'NIL Désodorisant Citron 4L',
                    'description'            => 'Désodorisant textile NIL senteur Citron – bidon 4L',
                    'product_subcategory_id' => $desodSubcatId,
                    'image'                  => null,
                ],
                // Marine en 1L et 4L
                [
                    'slug'                   => 'nil-desodorisant-marine-1l',
                    'name'                   => 'NIL Désodorisant Marine 1L',
                    'description'            => 'Désodorisant textile NIL senteur Marine – flacon 1L',
                    'product_subcategory_id' => $desodSubcatId,
                    'image'                  => null,
                ],
                [
                    'slug'                   => 'nil-desodorisant-marine-4l',
                    'name'                   => 'NIL Désodorisant Marine 4L',
                    'description'            => 'Désodorisant textile NIL senteur Marine – bidon 4L',
                    'product_subcategory_id' => $desodSubcatId,
                    'image'                  => null,
                ],
                // Floral en 1L et 4L
                [
                    'slug'                   => 'nil-desodorisant-floral-1l',
                    'name'                   => 'NIL Désodorisant Floral 1L',
                    'description'            => 'Désodorisant textile NIL senteur Florale – flacon 1L',
                    'product_subcategory_id' => $desodSubcatId,
                    'image'                  => null,
                ],
                [
                    'slug'                   => 'nil-desodorisant-floral-4l',
                    'name'                   => 'NIL Désodorisant Floral 4L',
                    'description'            => 'Désodorisant textile NIL senteur Florale – bidon 4L',
                    'product_subcategory_id' => $desodSubcatId,
                    'image'                  => null,
                ],
            ];

            foreach ($desodProducts as $p) {
                Product::firstOrCreate(['slug' => $p['slug']], $p);
            }
            $this->command->info('  ✔ Désodorisant : ' . count($desodProducts) . ' formats 1L/4L ajoutés (citron, marine, floral)');
        }

        // =====================================================
        // 2. ZEN BREEZE VÉHICULE : ajouter produits voiture
        //    Chercher la sous-catégorie véhicule Zen Breeze (ou en créer une)
        // =====================================================
        $zenBreezeCat = ProductCategory::where('slug', 'like', '%zen%')
            ->orWhere('name', 'like', '%Zen%')
            ->first();

        if (!$zenBreezeCat) {
            $this->command->warn('  ⚠ Catégorie Zen Breeze introuvable en BDD');
        } else {
            $vehiculeSubcat = ProductSubcategory::firstOrCreate(
                ['slug' => 'zen-breeze-vehicule'],
                [
                    'product_category_id' => $zenBreezeCat->id,
                    'name'                => 'Véhicule',
                    'description'         => 'Produits Zen Breeze pour véhicule',
                ]
            );
            $this->command->info('  ✔ Sous-catégorie Zen Breeze Véhicule (ID ' . $vehiculeSubcat->id . ')');

            $zenVehiculeProducts = [
                [
                    'slug'        => 'zen-breeze-vehicule-desodorisant-400ml',
                    'name'        => 'ZEN BREEZE Désodorisant Véhicule 400ml',
                    'description' => 'Brume désodorisante Zen Breeze spécial habitacle – 400ml',
                    'image'       => null,
                ],
                [
                    'slug'        => 'zen-breeze-vehicule-desodorisant-citron-400ml',
                    'name'        => 'ZEN BREEZE Désodorisant Véhicule Citron 400ml',
                    'description' => 'Brume désodorisante Zen Breeze habitacle senteur Citron – 400ml',
                    'image'       => null,
                ],
                [
                    'slug'        => 'zen-breeze-vehicule-desodorisant-floral-400ml',
                    'name'        => 'ZEN BREEZE Désodorisant Véhicule Bouquet Floral 400ml',
                    'description' => 'Brume désodorisante Zen Breeze habitacle senteur Florale – 400ml',
                    'image'       => null,
                ],
            ];

            foreach ($zenVehiculeProducts as $p) {
                Product::firstOrCreate(
                    ['slug' => $p['slug']],
                    array_merge($p, ['product_subcategory_id' => $vehiculeSubcat->id])
                );
            }
            $this->command->info('  ✔ Zen Breeze Véhicule : ' . count($zenVehiculeProducts) . ' produits ajoutés');
        }

        // =====================================================
        // NOTE : Parfums premium
        // =====================================================
        // Pour ajouter la mention "Premium" : nommer les produits avec le mot "Premium"
        // dans leur champ `name` (ex: "ZEN BREEZE Brume Premium Jasmin 400ml")
        // Le front détecte automatiquement le badge doré via getBadge().
        $this->command->info('  ℹ Parfums premium : renommer les produits concernés avec "Premium" dans le nom via l\'admin ou Tinker');

        $this->command->info('');
        $this->command->info('✅ DetergentProductUpdateSeeder terminé.');
    }
}
