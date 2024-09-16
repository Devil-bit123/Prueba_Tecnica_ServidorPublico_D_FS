<?php

namespace App\Http\Controllers;

use App\Models\Autor;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class AutorApiController extends Controller
{
    /**
     * Este método controla la solicitud para obtener una lista de autores.
     *
     * */
    public function index(Request $request): JsonResponse
    {
        $autors = Autor::all();
        return response()->json($autors);
    }

    /**
     * Este método maneja la creación de un nuevo autor.
     * Valida los datos de entrada y, si son válidos, crea un nuevo registro de autor en la base de datos.
     * Si hay errores de validación, devuelve un mensaje de error con los detalles correspondientes.
     */

    public function store(Request $request): JsonResponse
    {
        try {
            $validData = $request->validate(Autor::$rules);

            $autor = Autor::create($validData);

            return response()->json($autor, 201);
        } catch (ValidationException $e) {
            return response()->json([
                'errors' => $e->errors(),
                'message' => 'Ocurrió un error en la validación.'
            ], 422);
        }
    }

    /**
     * Este método muestra un autor en formato JSON.
     * Recibe un objeto Autor y devuelve su representación JSON como respuesta.
     */

    public function show(Autor $autor): JsonResponse
    {
        return response()->json($autor);
    }

    /**
     * Este método actualiza un autor en la base de datos.
     * Primero, valida los datos de entrada según las reglas definidas en la clase Autor.
     * Si la validación es exitosa, actualiza el registro del autor y devuelve el objeto actualizado en formato JSON. Si ocurre un error de validación, devuelve un mensaje de error junto con los detalles de los errores de validación.
     */

    public function update(Request $request, Autor $autor): JsonResponse
    {
        try {
            $validData = $request->validate(Autor::$rules);

            $autor->update($validData);

            return response()->json($autor);
        } catch (ValidationException $e) {
            return response()->json([
                'errors' => $e->errors(),
                'message' => 'Ocurrió un error en la validación.'
            ], 422);
        }
    }

    /**
     * Este método se encarga de eliminar un autor de la base de datos.
     * Intenta borrar el autor especificado y devuelve una respuesta JSON con un mensaje de éxito.
     * Si ocurre un error durante el proceso, se captura la excepción y se devuelve un mensaje de error junto con el detalle de la excepción.
     */
    public function destroy(Autor $autor): JsonResponse
    {
        try {
            $autor->delete();
            return response()->json('Autor eliminado', 202);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Ocurrió un error al eliminar el autor.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
