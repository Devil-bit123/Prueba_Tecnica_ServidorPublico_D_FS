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

        // Obtener los resultados
        $libros = $query->paginate(10);

        return view('vendor.voyager.libros.browse', compact('libros', 'search', 'filter', 'sort', 'direction'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $autors = Autor::all();
        return view('vendor.voyager.libros.edit-add', [
            'method' => 'P',
            'autors' => $autors
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $validData = $request->validate(Libro::$rules);
            Libro::create($validData);

            return redirect()->route('voyager.libros.index')
                ->with('success', 'El libro ha sido creado correctamente.');
        } catch (ValidationException $e) {
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
        $autors = Autor::all();
        return view('vendor.voyager.libros.edit-add', [
            'libro' => $libro,
            'autors' => $autors
        ]);
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
            $validData = $request->validate(Libro::$rules);
            $libro->update($validData);

            return redirect()->route('voyager.libros.index')
                ->with('success', 'El libro ha sido editado correctamente.');
        } catch (ValidationException $e) {
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
            $libro->delete();

            return redirect()->route('voyager.libros.index', $request->only(['sort', 'direction', 'search']))
                ->with('success', 'El libro ha sido eliminado correctamente.');
        } catch (\Exception $e) {
            return redirect()->route('voyager.libros.index', $request->only(['sort', 'direction', 'search']))
                ->with('error', 'Ocurrió un error al eliminar el libro.');
        }
    }
}
