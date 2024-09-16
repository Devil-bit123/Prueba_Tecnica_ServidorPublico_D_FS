<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Autor;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AutorApiControllerTest extends TestCase
{

    use RefreshDatabase;

    /** @test */
    public function it_can_get_all_autores()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        Autor::factory()->count(3)->create();

        // Act
        $response = $this->getJson('/api/autores');

        // Assert
        $response->assertStatus(200)
            ->assertJsonStructure([
                '*' => ['id', 'nombres', 'fechaNacimiento']
            ]);
    }

    /** @test */
    public function it_can_store_a_new_autor()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $data = [
            'nombres' => 'John Doe',
            'fechaNacimiento' => '1990-01-01'
        ];

        // Act
        $response = $this->postJson('/api/autores', $data);

        // Assert
        $response->assertStatus(201)
                 ->assertJsonFragment($data);

        $this->assertDatabaseHas('autors', $data);
    }

    /** @test */
    public function it_can_update_an_autor()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $autor = Autor::factory()->create();
        $data = [
            'nombres' => 'Jane Doe',
            'fechaNacimiento' => '1985-05-15'
        ];

        // Act
        $response = $this->putJson("/api/autores/{$autor->id}", $data);

        // Assert
        $response->assertStatus(200)
                 ->assertJsonFragment($data);

        $this->assertDatabaseHas('autors', $data);
    }

    /** @test */
    public function it_can_delete_an_autor()
    {
        // Arrange
        /** @var \App\Models\User $user */
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $autor = Autor::factory()->create();

        // Act
        $response = $this->deleteJson("/api/autores/{$autor->id}");

        // Assert
        $response->assertStatus(202)
                 ->assertExactJson(['Autor eliminado']);

        $this->assertDatabaseMissing('autors', ['id' => $autor->id]);
    }

}
