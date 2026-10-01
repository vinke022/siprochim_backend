<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ProductAnalytic;

class ProductAnalyticSeeder extends Seeder
{
    public function run()
    {
        $analytics = [
            ['Protéines','0','g'],
            ['Énergie','0','kcal'],
            ['Sodium','1.2','mg'],
            ['Douceur','99','%'],
            ['Teneur en sel','0.8','g'],
            ['Biodégradable','95','%'],
            ['Agents actifs','5','g'],
            ['pH','7',''],
            ['Parfum','Fleurie',''],
            ['Hypoallergénique','Oui','']
        ];
        $data = [];
        for($product=1; $product<=10; $product++) {
            foreach($analytics as $a){
                $data[] = [
                    'product_id' => $product,
                    'label' => $a[0],
                    'value' => $a[1],
                    'unit'  => $a[2],
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
        }
        ProductAnalytic::insert($data);
    }
}
