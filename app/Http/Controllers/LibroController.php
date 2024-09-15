<?php

namespace App\Http\Controllers;

use App\Models\Autor;
use App\Models\Libro;
use Illuminate\Http\Request;
use Dotenv\Exception\ValidationException;

class LibroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Libro::with('autor');

        // Filtro de búsqueda
        $search = $request->input('search');
        $filter = $request->input('filter');

        if ($search && $filter) {
            if ($filter == 'autor') {
                $query->whereHas('autor', function ($q) use ($search) {
                    $q->where('nombres', 'like', "%{$search}%");
                });
            } else {
                $query->where($filter, 'like', "%{$search}%");
            }
        }

        // Ordenamiento
        $sort = $request->input('sort', 'id'); // Ordenar por 'id' de manera predeterminada
        $direction = $request->input('direction', 'asc'); // Dirección predeterminada 'asc'

        // Si se selecciona 'autor', ordenar por el nombre del autor
        if ($sort == 'autor') {
            $query->join('autors', 'libros.autor_id', '=', 'autors.id')
                ->orderBy('autors.nombres', $direction);
        } else {
            $query->orderBy($sort, $direction);
        }

        // Obtener los resultados
        $libros = $query->paginate(10);

        return view('vendor.voyager.libros.browse', compact('libros', 'search'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $method = 'P';
        $autors = Autor::all();
        return view('vendor.voyager.libros.edit-add', compact('method', 'autors'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        try {
            // Validación de los datos del request
            $validData = $request->validate(Libro::$rules);

            $libro = Libro::create($validData);

            // Redirección en caso de éxito
            return redirect()->route('voyager.libros.index')->with('success', 'El libro ha sido editado correctamente.');
        } catch (ValidationException $e) {
            // Manejo de errores de validación
            return redirect()->route('voyager.libros.index')
                ->withErrors($e->errors())
                ->withInput()
                ->with('error', 'Ocurrió un error en la validación.');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */
    public function show(Libro $libro)
    {
        //
        return view('vendor.voyager.libros.read', compact('libro'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */
    public function edit(Libro $libro)
    {
        //
        $autors = Autor::all();
        return view('vendor.voyager.libros.edit-add', compact('libro', 'autors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request, Libro $libro)
    {
        try {
            // Validación de los datos del request
            $validData = $request->validate(Libro::$rules);

            // Actualización de los atributos del libro
            $libro->titulo = $request->input('titulo');
            $libro->anio = $request->input('anio');
            $libro->genero = $request->input('genero');
            $libro->idioma = $request->input('idioma');
            $libro->descripcion = $request->input('descripcion');

            // Actualización del autor (clave foránea)
            $libro->autor_id = $request->input('autor_id'); // Asumiendo que tienes un campo autor_id en la tabla libros

            // Guardar los cambios
            $libro->save();

            // Redirección en caso de éxito
            return redirect()->route('voyager.libros.index')->with('success', 'El libro ha sido editado correctamente.');
        } catch (ValidationException $e) {
            // Manejo de errores de validación
            return redirect()->route('voyager.libros.edit', $libro->id)
                ->withErrors($e->errors())
                ->withInput()
                ->with('error', 'Ocurrió un error en la validación.');
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Libro $libro)
    {
        try {
            // Elimina el autor
            $libro->delete();

            // Redirige a la ruta 'autors.index' con los mismos parámetros de consulta
            return redirect()->route('voyager.libros.index', [
                'sort_by' => $request->input('sort_by', 'id'),
                'sort_order' => $request->input('sort_order', 'asc'),
                'search' => $request->input('search', '')
            ])->with('success', 'Autor eliminado correctamente.');
        } catch (\Exception $e) {
            // Redirige con un mensaje de error en caso de fallo
            return redirect()->route('voyager.libros.index', [
                'sort_by' => $request->input('sort_by', 'id'),
                'sort_order' => $request->input('sort_order', 'asc'),
                'search' => $request->input('search', '')
            ])->with('error', 'Ocurrió un error al eliminar el autor.');
        }
    }
}
