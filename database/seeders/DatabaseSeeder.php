<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{

    public function run()
    {
        $path = storage_path('database.sql');

        $sql = file_get_contents($path);
        DB::unprepared($sql);
    }
}
