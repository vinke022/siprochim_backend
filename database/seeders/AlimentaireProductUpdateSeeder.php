<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use App\Models\Product;
use App\Models\ProductSubcategory;
use App\Models\ProductCategory;

/**
 * Met à jour la gamme Alimentaire :
 *  1. Gamme Mayo : sépare "Mayonnaise" en "Mayo classique" + "Mayo aromatisée"
 *  2. Bouillons  : supprime tablettes & barquettes (garde sachet + stick)
 *  3. Bouillons pimentés : passe le stick de 10g → 60g
 *  4. Ketchup    : ajoute le format 350ml
 *  5. Top Mayo   : ajoute 25ml, 1,5L, 3,8L
 *  6. Top Moutarde : crée sous-catégorie + produits de base
 *
 * Exécuter avec :
 *   php artisan db:seed --class=AlimentaireProductUpdateSeeder
 */
class AlimentaireProductUpdateSeeder extends Seeder
{
    public function run(): void
    {
        // =====================================================
        // 1. GAMME MAYO : "Mayonnaise" → "Mayo classique"
        //    + nouvelle sous-cat "Mayo aromatisée"
        //    (Light Mayonnaise bocal 250ml déplacée dedans)
        // =====================================================
        $subMayo = ProductSubcategory::find(16);
        if ($subMayo) {
            $subMayo->update([
                'name' => 'Mayo classique',
                'slug' => 'aromate-mayo-classique',
            ]);
            $this->command->info('  ✔ Subcat 16 renommée en "Mayo classique"');
        }

        $aromateCat = ProductCategory::where('slug', 'aromate')->first();
        $mayoAromatisee = ProductSubcategory::firstOrCreate(
            ['slug' => 'aromate-mayo-aromatisee'],
            [
                'product_category_id' => $aromateCat?->id ?? 8,
                'name'                => 'Mayo aromatisée',
                'description'         => 'Mayonnaises aromatisées Aromate (Light, Bocal…)',
            ]
        );
        $this->command->info('  ✔ Subcat "Mayo aromatisée" créée (ID ' . $mayoAromatisee->id . ')');

        // Déplacer "AROMATE Light Mayonnaise Bocal 250ml" (ID 285) → Mayo aromatisée
        $moved = Product::where('id', 285)->update([
            'product_subcategory_id' => $mayoAromatisee->id,
        ]);
        if ($moved) {
            $this->command->info('  ✔ Produit 285 (Light Mayonnaise) déplacé vers "Mayo aromatisée"');
        }

        // =====================================================
        // 2. BOUILLONS : supprimer tablettes et barquettes
        // =====================================================
        $toDelete = [
            300, // AROMATE Épices Barquette 60x10
            297, // AROMATE Crevette Barquette 60x10
            316, // AROMATE Poulet Barquette 60x10
            319, // AROMATE Tablette Crevette 10g
            320, // AROMATE Tablette Epice 10g
            321, // AROMATE Tablette Poulet 10g
        ];
        $deleted = Product::whereIn('id', $toDelete)->delete();
        $this->command->info("  ✔ $deleted produits tablette/barquette supprimés");

        // =====================================================
        // 3. BOUILLONS PIMENTÉS : stick 10g → 60g + sachet 50g
        // =====================================================
        Product::where('id', 315)->update([
            'name' => 'AROMATE Piment Stick 60g',
            'slug' => 'aromate-piment-stick-60g',
        ]);
        $this->command->info('  ✔ Produit 315 : Piment Stick mis à jour 10g → 60g');

        // Récupérer la sous-catégorie du stick pimenté pour y rattacher le sachet
        $pimentProduct = Product::find(315);
        if ($pimentProduct) {
            Product::firstOrCreate(
                ['slug' => 'aromate-piment-sachet-50g'],
                [
                    'product_subcategory_id' => $pimentProduct->product_subcategory_id,
                    'name'                   => 'AROMATE Piment Sachet 50g',
                    'description'            => 'Bouillon pimenté Aromate sachet 50g',
                    'image'                  => null,
                ]
            );
            $this->command->info('  ✔ Piment Sachet 50g ajouté (subcat ' . $pimentProduct->product_subcategory_id . ')');
        } else {
            $this->command->warn('  ⚠ Produit 315 introuvable, sachet 50g non créé');
        }

        // =====================================================
        // 4. KETCHUP : ajouter format 350ml
        // =====================================================
        [$ketchup350, $created] = [
            Product::firstOrCreate(
                ['slug' => 'aromate-ketchup-350ml'],
                [
                    'product_subcategory_id' => 55,
                    'name'                   => 'AROMATE Ketchup 350ml',
                    'description'            => 'Ketchup Aromate bouteille squeeze 350ml',
                    'image'                  => null, // ← À renseigner avec le bon visuel
                ]
            ),
            !Product::where('slug', 'aromate-ketchup-350ml')->exists(),
        ];
        $this->command->info('  ✔ Ketchup 350ml ' . ($created ? 'créé' : 'déjà existant'));

        // =====================================================
        // 5. TOP MAYO : ajouter 25ml, 1,5L, 3,8L
        // =====================================================
        $topMayoSubcatId = 49;
        $topMayoNew = [
            [
                'slug'                   => 'top-mayo-mayonnaise-25ml',
                'name'                   => 'TOP MAYO Mayonnaise 25ml',
                'description'            => 'Top Mayo Mayonnaise sachet 25ml',
                'product_subcategory_id' => $topMayoSubcatId,
                'image'                  => null,
            ],
            [
                'slug'                   => 'top-mayo-mayonnaise-15l',
                'name'                   => 'TOP MAYO Mayonnaise 1,5L',
                'description'            => 'Top Mayo Mayonnaise bidon 1,5L',
                'product_subcategory_id' => $topMayoSubcatId,
                'image'                  => null,
            ],
            [
                'slug'                   => 'top-mayo-mayonnaise-38l',
                'name'                   => 'TOP MAYO Mayonnaise 3,8L',
                'description'            => 'Top Mayo Mayonnaise seau 3,8L',
                'product_subcategory_id' => $topMayoSubcatId,
                'image'                  => null,
            ],
        ];
        foreach ($topMayoNew as $p) {
            Product::firstOrCreate(['slug' => $p['slug']], $p);
        }
        $this->command->info('  ✔ Top Mayo : 3 formats ajoutés (25ml, 1,5L, 3,8L)');

        // =====================================================
        // 6. TOP MOUTARDE : créer sous-catégorie + produits
        // =====================================================
        $topMoutardeCat = ProductCategory::where('slug', 'top-moutarde')->first();
        if ($topMoutardeCat) {
            $topMoutardeSubcat = ProductSubcategory::firstOrCreate(
                ['slug' => 'top-moutarde-moutarde'],
                [
                    'product_category_id' => $topMoutardeCat->id,
                    'name'                => 'Moutarde',
                    'description'         => 'Gamme Moutarde Top Moutarde',
                ]
            );
            $this->command->info('  ✔ Top Moutarde sous-catégorie créée (ID ' . $topMoutardeSubcat->id . ')');

            $topMoutardeProducts = [
                [
                    'slug'        => 'top-moutarde-sachet-25ml',
                    'name'        => 'TOP MOUTARDE Sachet 25ml',
                    'description' => 'Moutarde Top Moutarde sachet portion 25ml',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-squeeze-270g',
                    'name'        => 'TOP MOUTARDE Squeeze 270g',
                    'description' => 'Moutarde Top Moutarde flacon squeeze 270g',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-squeeze-380g',
                    'name'        => 'TOP MOUTARDE Squeeze 380g',
                    'description' => 'Moutarde Top Moutarde flacon squeeze 380g',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-bocal-270g',
                    'name'        => 'TOP MOUTARDE Bocal 270g',
                    'description' => 'Moutarde Top Moutarde bocal 270g',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-bocal-490g',
                    'name'        => 'TOP MOUTARDE Bocal 490g',
                    'description' => 'Moutarde Top Moutarde bocal 490g',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-1kg',
                    'name'        => 'TOP MOUTARDE 1kg',
                    'description' => 'Moutarde Top Moutarde 1kg',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-seau-2kg',
                    'name'        => 'TOP MOUTARDE Seau 2kg',
                    'description' => 'Moutarde Top Moutarde seau 2kg (usage professionnel)',
                    'image'       => null,
                ],
                [
                    'slug'        => 'top-moutarde-seau-5kg',
                    'name'        => 'TOP MOUTARDE Seau 5kg',
                    'description' => 'Moutarde Top Moutarde seau 5kg (usage professionnel)',
                    'image'       => null,
                ],
            ];

            foreach ($topMoutardeProducts as $p) {
                Product::firstOrCreate(
                    ['slug' => $p['slug']],
                    array_merge($p, ['product_subcategory_id' => $topMoutardeSubcat->id])
                );
            }
            $this->command->info('  ✔ Top Moutarde : ' . count($topMoutardeProducts) . ' produits ajoutés');
        } else {
            $this->command->warn('  ⚠ Catégorie top-moutarde introuvable – vérifier la BDD');
        }

        // =====================================================
        // NOTE : MIA Mayonnaise 950ml (ID 330)
        // =====================================================
        // L'image du pot 950ml doit être remplacée manuellement :
        //   Product::find(330)->update(['image' => 'products/NOM_DU_NOUVEAU_FICHIER.png']);
        // Uploader d'abord le visuel dans storage/app/public/products/
        $this->command->warn('  ⚠ MIA 950ml (ID 330) : image à mettre à jour manuellement après upload du visuel');

        $this->command->info('');
        $this->command->info('✅ AlimentaireProductUpdateSeeder terminé avec succès.');
    }
}
