<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ProductFamily;
use Illuminate\Support\Str;

class ProductFamilySeeder extends Seeder
{
    public function run()
    {
        $families = [
            [
                'name' => 'Alimentaire',
                'slug' => Str::slug('Alimentaire'),
                'image' => null,
            ],
            [
                'name' => 'Détergent',
                'slug' => Str::slug('Détergent'),
                'image' => null,
            ],
            [
                'name' => 'Cosmétique',
                'slug' => Str::slug('Cosmétique'),
                'image' => null,
            ],
        ];

        foreach ($families as $family) {
            ProductFamily::create($family);
        }
    }
}
