<?php

namespace App\Http\Controllers;

use App\Models\Libro;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class LibroApiController extends Controller
{
    /**
     *Este método maneja la solicitud para obtener una lista de libros junto con sus autores.
     * Utiliza Eloquent para recuperar todos los registros de libros, incluyendo la relación con el autor,
     *y devuelve los datos en formato JSON con un código de estado 200.
     */
    public function index(Request $request): JsonResponse
    {
        $libros = Libro::with('autor')->get();
        return response()->json($libros, 200);
    }


    /**
     * // Este método maneja la creación de un nuevo libro.
     * Primero, valida los datos de la solicitud según las reglas definidas en el modelo Libro.
     * Si la validación es exitosa, crea un nuevo registro de libro y devuelve una respuesta JSON con un mensaje de éxito y los datos del libro creado.
     * Si ocurre un error de validación, devuelve un mensaje de error y los detalles de la validación fallida.
     */
    public function store(Request $request): JsonResponse
    {
        try {
            $validData = $request->validate(Libro::$rules);
            $libro = Libro::create($validData);

            return response()->json(['message' => 'Libro creado exitosamente', 'libro' => $libro], 201);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors(), 'message' => 'Ocurrió un error en la validación'], 422);
        }
    }

    /**
     * Este método muestra un libro específico en formato JSON y devuelve una respuesta con un código de estado 200.
     */
    public function show(Libro $libro): JsonResponse
    {
        return response()->json($libro, 200);
    }

    /**
     *  Este método actualiza un objeto 'Libro' en la base de datos.
     * Primero, valida los datos recibidos en la solicitud.
     * Si la validación es exitosa, actualiza el objeto 'Libro' con los datos válidos y devuelve una respuesta JSON con un mensaje de éxito y el objeto actualizado.
     * Si hay un error de validación, devuelve una respuesta JSON con los errores y un mensaje de error.
     */
    public function update(Request $request, Libro $libro): JsonResponse
    {
        try {
            $validData = $request->validate(Libro::$rules);
            $libro->update($validData);

            return response()->json(['message' => 'Libro actualizado correctamente', 'libro' => $libro], 200);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors(), 'message' => 'Ocurrió un error en la validación'], 422);
        }
    }


    /**
     * Este método se encarga de eliminar un libro específico.
     * Intenta eliminar el libro y devuelve un mensaje de éxito con un código de estado 204.
     * Si ocurre un error, captura la excepción y devuelve un mensaje de error con un código de estado 500.
     */
    public function destroy(Libro $libro): JsonResponse
    {
        try {
            $libro->delete();

            return response()->json(['message' => 'Libro eliminado correctamente'], 204);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Ocurrió un error al eliminar el libro'], 500);
        }
    }
}
