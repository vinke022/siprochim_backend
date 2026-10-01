<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ProductAccordion;

class ProductAccordionSeeder extends Seeder
{
    public function run()
    {
        $titles = [
            'UTILISATION', 'CONSEILS', 'PRÉCAUTIONS', 'STOCKAGE', 'AVERTISSEMENTS',
            'INNOVATION', 'COMPOSITION', 'RECYCLAGE', 'CERTIFICATION', 'GARANTIE'
        ];
        $data = [];
        for($product=1; $product<=10; $product++) {
            for($i=0; $i<10; $i++){
                $data[] = [
                    'product_id' => $product,
                    'title' => $titles[$i],
                    'content' => "Contenu de {$titles[$i]} pour le produit $product.",
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
        }
        ProductAccordion::insert($data);
    }
}
