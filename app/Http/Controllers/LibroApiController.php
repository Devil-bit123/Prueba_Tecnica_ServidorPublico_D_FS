<?php

namespace App\Http\Controllers;

use App\Models\Libro;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class LibroApiController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @param  Request  $request
     * @return JsonResponse
     */
    public function index(Request $request): JsonResponse
    {
        $query = Libro::with('autor');

        // Filtro de búsqueda
        $search = $request->input('search');
        $filter = $request->input('filter');
        $sort = $request->input('sort', 'id');
        $direction = $request->input('direction', 'asc');

        if ($search) {
            if ($filter === 'autor') {
                $query->whereHas('autor', function ($q) use ($search) {
                    $q->where('nombres', 'like', "%{$search}%");
                });
            } else {
                $query->where($filter, 'like', "%{$search}%");
            }
        }

        // Ordenamiento
        if ($sort === 'autor') {
            $query->join('autors', 'libros.autor_id', '=', 'autors.id')
                ->orderBy('autors.nombres', $direction);
        } else {
            $query->orderBy($sort, $direction);
        }

        // Obtener los resultados paginados
        $libros = $query->get();

        return response()->json($libros, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return JsonResponse
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
     * Display the specified resource.
     *
     * @param  Libro  $libro
     * @return JsonResponse
     */
    public function show(Libro $libro): JsonResponse
    {
        return response()->json($libro, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  Libro  $libro
     * @return JsonResponse
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
     * Remove the specified resource from storage.
     *
     * @param  Libro  $libro
     * @return JsonResponse
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
