<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Post::class;



    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->title,
            'extract' => $this->faker->paragraph,
            'body' => $this->faker->paragraph,
            'main_image' => 'https://cdn.pixabay.com/photo/2015/05/15/14/38/computer-768608_960_720.jpg',
/*             'category_id' => Category::factory(),
            'user_id' => User::factory() */
        ];
    }
}
