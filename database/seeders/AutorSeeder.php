<?php

namespace Database\Seeders;

use App\Models\Autor;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class AutorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        for ($i = 0; $i < 25; $i++) {
            Autor::create([
                'nombres' => $faker->name(),
                'fechaNacimiento' => $faker->date('Y-m-d', '2000-01-01') // Fecha aleatoria antes del 1 de enero del 2000
            ]);
        }
    }
}
