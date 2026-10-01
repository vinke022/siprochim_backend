<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\JobOffer;
use App\Models\Product;

/**
 * 1. Migre les offres hardcodées du front vers la BDD
 * 2. Renomme les parfums premium avec le mot "Premium"
 *
 * Exécuter avec :
 *   php artisan db:seed --class=JobOffersAndPremiumSeeder
 */
class JobOffersAndPremiumSeeder extends Seeder
{
    public function run(): void
    {
        // =====================================================
        // 1. OFFRES D'EMPLOI
        // =====================================================
        $offers = [
            [
                'slug'             => 'responsable-qualite',
                'poste'            => 'Responsable Qualité',
                'lieu'             => 'Abidjan',
                'type'             => 'CDI',
                'description'      => "Nous recherchons un(e) Responsable Qualité pour garantir la conformité de nos processus et produits aux normes internationales.",
                'missions'         => [
                    "Définir et mettre en œuvre la politique qualité de l'entreprise",
                    "Superviser les audits internes et externes",
                    "Assurer la conformité aux normes ISO 9001",
                    "Former et sensibiliser les équipes aux procédures qualité",
                    "Analyser les non-conformités et proposer des actions correctives",
                    "Gérer la documentation qualité et les certifications",
                ],
                'profil'           => [
                    "Diplôme Bac+5 en Qualité, Chimie ou équivalent",
                    "Minimum 5 ans d'expérience en management qualité",
                    "Maîtrise des normes ISO 9001",
                    "Excellentes capacités d'analyse et de synthèse",
                    "Leadership et esprit d'équipe",
                    "Maîtrise du français et de l'anglais",
                ],
                'avantages'        => [
                    "Salaire attractif selon profil",
                    "Prime de performance",
                    "Assurance santé",
                    "Formations continues",
                    "Environnement de travail moderne",
                ],
                'date_publication' => '2026-01-15',
                'active'           => true,
            ],
            [
                'slug'             => 'charge-communication',
                'poste'            => 'Chargé(e) de Communication',
                'lieu'             => 'Abidjan',
                'type'             => 'CDI',
                'description'      => "Rejoignez notre équipe marketing en tant que Chargé(e) de Communication pour développer notre image de marque et notre présence sur les différents canaux.",
                'missions'         => [
                    "Élaborer et mettre en œuvre la stratégie de communication",
                    "Gérer les réseaux sociaux et la présence digitale",
                    "Créer du contenu (textes, visuels, vidéos)",
                    "Organiser des événements et relations presse",
                    "Analyser les performances des campagnes",
                    "Coordonner avec les agences externes",
                ],
                'profil'           => [
                    "Bac+4/5 en Communication, Marketing ou équivalent",
                    "2 à 5 ans d'expérience",
                    "Maîtrise des réseaux sociaux et des outils digitaux",
                    "Créativité et sens de l'esthétique",
                    "Excellentes compétences rédactionnelles",
                ],
                'avantages'        => [
                    "Salaire compétitif",
                    "Environnement créatif et dynamique",
                    "Projets variés et stimulants",
                    "Opportunités de développement professionnel",
                ],
                'date_publication' => '2026-01-10',
                'active'           => true,
            ],
            [
                'slug'             => 'technicien-laboratoire-abidjan',
                'poste'            => 'Technicien(ne) Laboratoire',
                'lieu'             => 'Abidjan',
                'type'             => 'CDI',
                'description'      => "Nous recherchons un(e) Technicien(ne) Laboratoire rigoureux(se) pour renforcer notre équipe R&D.",
                'missions'         => [
                    "Réaliser des analyses physico-chimiques",
                    "Contrôler la qualité des matières premières et produits finis",
                    "Participer au développement de nouvelles formulations",
                    "Maintenir les équipements de laboratoire",
                    "Rédiger les rapports d'analyses",
                ],
                'profil'           => [
                    "BTS/DUT Chimie ou Analyses Biologiques",
                    "1 à 3 ans d'expérience en laboratoire industriel",
                    "Maîtrise des techniques d'analyse (HPLC, GC, spectrophotométrie)",
                    "Rigueur et précision",
                ],
                'avantages'        => [
                    "Formation continue",
                    "Équipements modernes",
                    "Environnement de travail stimulant",
                ],
                'date_publication' => '2026-01-08',
                'active'           => true,
            ],
            [
                'slug'             => 'technicien-laboratoire-san-pedro',
                'poste'            => 'Technicien(ne) Laboratoire',
                'lieu'             => 'San-Pédro',
                'type'             => 'CDI',
                'description'      => "Poste basé à San-Pédro pour renforcer notre capacité analytique sur le site secondaire.",
                'missions'         => [
                    "Réaliser des analyses physico-chimiques",
                    "Contrôler la qualité des matières premières et produits finis",
                    "Maintenir les équipements de laboratoire",
                    "Rédiger les rapports d'analyses",
                ],
                'profil'           => [
                    "BTS/DUT Chimie ou Analyses Biologiques",
                    "Expérience en laboratoire souhaitée",
                    "Mobilité géographique à San-Pédro",
                ],
                'avantages'        => [
                    "Logement de fonction possible",
                    "Prime de déplacement",
                    "Formation continue",
                ],
                'date_publication' => '2026-01-12',
                'active'           => true,
            ],
        ];

        foreach ($offers as $offer) {
            JobOffer::firstOrCreate(['slug' => $offer['slug']], $offer);
        }
        $this->command->info('  ✔ ' . count($offers) . ' offres d\'emploi créées en BDD');

        // =====================================================
        // 2. PARFUMS PREMIUM : ajouter "Premium" dans le nom
        //    Zen Breeze haut de gamme → parfums Jasmin, Rose, Vanille
        // =====================================================
        $premiumSlugs = [
            'zen-breeze-brume-jasmin'     => 'ZEN BREEZE Brume d\'Ambiance Premium Jasmin 400ml',
            'zen-breeze-brume-rose'       => 'ZEN BREEZE Brume d\'Ambiance Premium Rose 400ml',
            'zen-breeze-brume-vanille'    => 'ZEN BREEZE Brume d\'Ambiance Premium Vanille 400ml',
            'zen-breeze-brume-musc'       => 'ZEN BREEZE Brume d\'Ambiance Premium Musc Blanc 400ml',
        ];

        // Renommer les produits existants qui contiennent Zen Breeze sans encore "Premium"
        $updated = 0;
        foreach ($premiumSlugs as $slug => $newName) {
            // Chercher par slug ou par nom partiel
            $product = Product::where('slug', $slug)
                ->orWhere('name', 'like', '%' . str_replace(['ZEN BREEZE Brume d\'Ambiance Premium ', ' 400ml'], '', $newName) . '%')
                ->whereNotLike('name', '%Premium%')
                ->first();

            if ($product) {
                $product->update(['name' => $newName]);
                $updated++;
                $this->command->info("  ✔ Produit premium renommé : {$newName}");
            }
        }

        // Créer les parfums premium s'ils n'existent pas encore
        // Chercher la sous-catégorie Zen Breeze ambiance
        $zenSubcat = \App\Models\ProductSubcategory::where('slug', 'like', '%zen%')
            ->orWhere('slug', 'like', '%ambiance%')
            ->first();

        if ($zenSubcat) {
            foreach ($premiumSlugs as $slug => $name) {
                $existing = Product::where('name', 'like', '%' . explode(' 400ml', $name)[0] . '%')->exists();
                if (!$existing) {
                    Product::firstOrCreate(['slug' => $slug], [
                        'name'                   => $name,
                        'description'            => 'Parfum d\'ambiance haut de gamme Zen Breeze',
                        'product_subcategory_id' => $zenSubcat->id,
                        'image'                  => null,
                    ]);
                    $this->command->info("  ✔ Parfum premium créé : {$name}");
                }
            }
        } else {
            $this->command->warn('  ⚠ Sous-catégorie Zen Breeze introuvable – parfums premium non créés');
        }

        $this->command->info('');
        $this->command->info('✅ JobOffersAndPremiumSeeder terminé.');
    }
}
