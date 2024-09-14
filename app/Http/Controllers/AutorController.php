<?php

namespace App\Http\Controllers;

use App\Models\Autor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class AutorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        // Obtener parámetros de filtrado y ordenamiento
        $sortBy = $request->input('sort_by', 'id'); // Por defecto ordena por 'id'
        $sortOrder = $request->input('sort_order', 'asc'); // Por defecto ordena de manera ascendente

        // Filtrar por nombre si se proporciona un término de búsqueda
        $search = $request->input('search');

        // Construir la consulta
        $query = Autor::query();

        if ($search) {
            $query->where('nombres', 'like', "%{$search}%");
        }

        $autors = $query->orderBy($sortBy, $sortOrder)->paginate(10);

        return view('vendor.voyager.autors.browse', compact('autors', 'sortBy', 'sortOrder', 'search'));
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
        return view('vendor.voyager.autors.edit-add', compact('method'));
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
            //dd($request);
            // Validación de los datos del request
            $validData = $request->validate(Autor::$rules);

            // Creación del autor
            $autor = Autor::create($validData);

            // Redirección en caso de éxito
            return redirect()->route('autors.index')->with('success', 'El autor ha sido creado correctamente.');
        } catch (ValidationException $e) {
            // Captura los errores de validación y redirige con los errores
            return redirect()->route('autors.index')->withErrors($e->errors())->withInput()->with('error', 'Ocurrió un error en la validación.');
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Autor  $autor
     * @return \Illuminate\Http\Response
     */
    public function show(Autor $autor)
    {
        //
        return view('vendor.voyager.autors.read', compact('autor'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Autor  $autor
     * @return \Illuminate\Http\Response
     */
    public function edit(Autor $autor)
    {
        //
        return view('vendor.voyager.autors.edit-add', compact('autor'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Autor  $autor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Autor $autor)
    {

        //dd($autor);
        //dd($request);
        try {
            // Validación de los datos del request
            $validData = $request->validate(Autor::$rules);

            // Actualización del autor con los datos validados
            $autor->update($validData);
            $autor->nombres = $request->input('nombres');
            $autor->fechaNacimiento = $request->input('fechaNacimiento');
            $autor->save();
            // Redirección en caso de éxito
            return redirect()->route('autors.index')->with('success', 'El autor ha sido editado correctamente.');
        } catch (ValidationException $e) {
            // Captura los errores de validación y redirige con los errores
            return redirect()->route('autors.edit', $autor->id)
                ->withErrors($e->errors())
                ->withInput()
                ->with('error', 'Ocurrió un error en la validación.');
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Autor  $autor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Autor $autor)
    {
        try {
            // Elimina el autor
            $autor->delete();

            // Redirige a la ruta 'autors.index' con los mismos parámetros de consulta
            return redirect()->route('autors.index', [
                'sort_by' => $request->input('sort_by', 'id'),
                'sort_order' => $request->input('sort_order', 'asc'),
                'search' => $request->input('search', '')
            ])->with('success', 'Autor eliminado correctamente.');
        } catch (\Exception $e) {
            // Redirige con un mensaje de error en caso de fallo
            return redirect()->route('autors.index', [
                'sort_by' => $request->input('sort_by', 'id'),
                'sort_order' => $request->input('sort_order', 'asc'),
                'search' => $request->input('search', '')
            ])->with('error', 'Ocurrió un error al eliminar el autor.');
        }
    }
}
