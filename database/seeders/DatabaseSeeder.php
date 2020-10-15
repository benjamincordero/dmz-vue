<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{

    public function run()
    {

        \App\Models\User::factory(1)->create([
            'name' => 'Benjamín Cordero',
            'email' => 'admin@admin.com'
        ]);

        \App\Models\User::factory(5)->create();
        \App\Models\Type::factory()->create();
        \App\Models\Tithe::factory(2)->create();
        \App\Models\Offering::factory(5)->create();
    }
}
