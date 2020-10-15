<?php

namespace Database\Factories;

use App\Models\Offering;
use App\Models\Type;
use Illuminate\Database\Eloquent\Factories\Factory;

class OfferingFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Offering::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'amount'=>$this->faker->randomFloat($nbMaxDecimals = NULL, $min = 0, $max = NULL),
            'person'=>$this->faker->randomFloat($nbMaxDecimals = NULL, $min = 0, $max = NULL),
            'date'=>date('Y-m-d'),
            'type_id'=>Type::factory(),
            'currency'=>'Bs',
            'transfer_id'=>null,
        ];
    }
}
