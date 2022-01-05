<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{

    public function run()
    {
      \App\Models\Type::create(['name'=>'Carpa']);
      \App\Models\User::create(['name' => 'Benjamin Cordero', 'email' => 'admin@admin.com', 'role' => 'root', 'password'=>Hash::make('admin')]);
  
    }
}
