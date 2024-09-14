<?php

namespace Database\Seeders;

use App\Models\Autor;
use App\Models\Libro;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class LibroSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $faker = Faker::create();
        $generos = ['Ficción', 'No Ficción', 'Ciencia Ficción', 'Fantasia', 'Misterio', 'Romántico', 'Histórico', 'Biografía'];

        // Obtener todos los IDs de autores
        $autorIds = Autor::pluck('id')->toArray();

        // Crear 50 libros
        for ($i = 0; $i < 50; $i++) {
            Libro::create([
                'titulo' => $faker->sentence(),
                'anio' => $faker->date(),
                'autor_id' => $faker->randomElement($autorIds), // Asignar un autor aleatorio
                'idioma' => $faker->languageCode(),
                'genero' => $faker->randomElement($generos),
                'descripcion' => $faker->paragraph(),
            ]);
        }
    }
}
