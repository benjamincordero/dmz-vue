<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{

    public function run()
    {
        //\App\Models\Category::factory(3)->create();
        //\App\Models\Tag::factory(3)->create();
        \App\Models\Post::factory()->count(5)->forUser(['name' => 'Benjamin Cordero', 'email' => 'admin@admin.com', 'role' => 'root'])->forCategory(['name' => 'Tecnologia'])->hasTags(3)->create();
        \App\Models\User::factory(99)->create();
        \App\Models\Image::factory(3)->create();
    }
}
