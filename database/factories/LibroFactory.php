<?php

namespace Database\Factories;

use App\Models\Autor;
use App\Models\Libro;
use Illuminate\Database\Eloquent\Factories\Factory;

class LibroFactory extends Factory
{
    protected $model = Libro::class;

    // Definir un array de géneros predefinidos
    private $generosArray = ['Sci Fi', 'Terror', 'Romance'];

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'titulo' => $this->faker->sentence,
            'autor_id' => Autor::factory(),
            'anio' => $this->faker->date(),
            'genero' => $this->faker->randomElement($this->generosArray),
            'idioma' => $this->faker->languageCode(),
            'descripcion' => $this->faker->paragraph(),
        ];
    }
}
