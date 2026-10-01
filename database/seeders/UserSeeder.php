<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run()
    {
        // Un admin
        User::create([
            'name' => 'Super Admin',
            'email' => 'admin@siprochim.com',
            'password' => bcrypt('azerty123'),
        ]);
    }
}
