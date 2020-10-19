<?php

namespace Database\Factories;

use App\Models\Tithe;
use Illuminate\Database\Eloquent\Factories\Factory;

class TitheFactory extends Factory
{

    protected $model = Tithe::class;


    public function definition()
    {
        return [
            'amount'=>$this->faker->randomFloat($nbMaxDecimals = NULL, $min = 0, $max = NULL),
            'tithe'=>$this->faker->randomFloat($nbMaxDecimals = NULL, $min = 0, $max = NULL),
            'currency'=>'Bs',
            'person'=>$this->faker->name,
            'date'=>date('Y-m-d'),
            'transfer_id'=>null
        ];
    }
}
