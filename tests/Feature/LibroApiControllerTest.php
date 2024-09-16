<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Autor;
use App\Models\Libro;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class LibroApiControllerTest extends TestCase
{

    /** @test */
    public function it_can_get_all_libros()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $autor = Autor::factory()->create();
        Libro::factory()->count(3)->create(['autor_id' => $autor->id]);

        // Act
        $response = $this->getJson('/api/libros');

        // Assert
        $response->assertStatus(200)
            ->assertJsonStructure([
                '*' => ['id', 'titulo', 'autor_id', 'autor' => ['id', 'nombres', 'fechaNacimiento']]
            ]);
    }

    /** @test */
    public function it_can_store_a_new_libro()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $autor = Autor::factory()->create();
        $data = [
            'titulo' => 'Libro de prueba',
            'autor_id' => $autor->id,
            'anio' => '2020-02-12',
            'genero' => 'Ficcion',
            'idioma' => 'es',
            'descripcion' => 'Prueba',
        ];

        // Act
        $response = $this->postJson('/api/libros', $data);

        // Assert
        $response->assertStatus(201)
            ->assertJsonFragment($data);

        $this->assertDatabaseHas('libros', $data);
    }

    /** @test */

    public function it_can_show_a_libro()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $autor = Autor::factory()->create();
        $libro = Libro::factory()->create(['autor_id' => $autor->id]);

        // Act
        $response = $this->getJson("/api/libros/{$libro->id}");

        // Assert
        $response->assertStatus(200)
            ->assertJson([
                'id' => $libro->id,
                'titulo' => $libro->titulo,
                'autor_id' => $libro->autor_id,
                'anio' => $libro->anio,
                'genero' => $libro->genero,
                'idioma' => $libro->idioma,
                'descripcion' => $libro->descripcion,

            ]);
    }


    /** @test */
    public function it_can_update_a_libro()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $autor = Autor::factory()->create();
        $libro = Libro::factory()->create(['autor_id' => $autor->id]);

        $data = [
            'titulo' => 'Libro actualizado',
            'autor_id' => $autor->id,
            'anio' => '2020-02-12',
            'genero' => 'Ficcion',
            'idioma' => 'es',
            'descripcion' => 'Prueba',
        ];

        // Act
        $response = $this->putJson("/api/libros/{$libro->id}", $data);

        // Assert
        $response->assertStatus(200)
            ->assertJsonFragment($data);

        $this->assertDatabaseHas('libros', $data);
    }

    /** @test */
    public function it_can_delete_a_libro()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $autor = Autor::factory()->create();
        $libro = Libro::factory()->create(['autor_id' => $autor->id]);

        // Act
        $response = $this->deleteJson("/api/libros/{$libro->id}");

        // Assert
        $response->assertStatus(204);

        $this->assertDatabaseMissing('libros', ['id' => $libro->id]);
    }
}
