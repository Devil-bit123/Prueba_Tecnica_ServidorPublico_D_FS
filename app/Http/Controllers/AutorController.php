<?php

namespace App\Http\Controllers;

use App\Models\Autor;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class AutorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $autors = Autor::paginate(10);
        return view('autor.index', compact('autors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('autor.create');
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
            // Validación de los datos del request
            $validData = $request->validate(Autor::$rules);

            // Creación del autor
            $autor = Autor::create($validData);

            // Redirección en caso de éxito
            return redirect()->route('autor.index')->with('success', 'El autor ha sido creado correctamente.');

        } catch (ValidationException $e) {
            // Captura los errores de validación y redirige con los errores
            return redirect()->route('autor.index')->withErrors($e->errors())->withInput()->with('error', 'Ocurrió un error en la validación.');
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
        return view('autor.show', compact('autor'));
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
        //
        dd('revisar la edicion apra ver que llega en reques y que en autor');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Autor  $autor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Autor $autor)
    {
        //
        $autor->delete();
        return view('autor.index');
    }
}
