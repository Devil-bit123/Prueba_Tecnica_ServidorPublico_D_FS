<?php

namespace App\Http\Controllers;

use App\Models\Autor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class AutorController extends Controller
{
    public function index(Request $request)
    {
        $sortBy = $request->input('sort_by', 'id');
        $sortOrder = $request->input('sort_order', 'asc');
        $search = $request->input('search');

        $query = Autor::query();

        if ($search) {
            $query->where('nombres', 'like', "%{$search}%");
        }

        $autors = $query->orderBy($sortBy, $sortOrder)->paginate(10);

        return view('vendor.voyager.autors.browse', compact('autors', 'sortBy', 'sortOrder', 'search'));
    }

    public function create()
    {
        $method = 'P';
        return view('vendor.voyager.autors.edit-add', compact('method'));
    }

    public function store(Request $request)
    {
        try {
            $validData = $request->validate(Autor::$rules);

            Autor::create($validData);

            return redirect()->route('autors.index')->with('success', 'El autor ha sido creado correctamente.');
        } catch (ValidationException $e) {
            return redirect()->route('autors.index')
                ->withErrors($e->errors())
                ->withInput()
                ->with('error', 'Ocurrió un error en la validación.');
        }
    }

    public function show(Autor $autor)
    {
        return view('vendor.voyager.autors.read', compact('autor'));
    }

    public function edit(Autor $autor)
    {
        return view('vendor.voyager.autors.edit-add', compact('autor'));
    }

    public function update(Request $request, Autor $autor)
    {
        try {
            $validData = $request->validate(Autor::$rules);

            $autor->update($validData);

            return redirect()->route('autors.index')->with('success', 'El autor ha sido editado correctamente.');
        } catch (ValidationException $e) {
            return redirect()->route('autors.edit', $autor->id)
                ->withErrors($e->errors())
                ->withInput()
                ->with('error', 'Ocurrió un error en la validación.');
        }
    }

    public function destroy(Request $request, Autor $autor)
    {
        try {
            $autor->delete();

            return redirect()->route('autors.index', $this->getQueryParameters($request))
                ->with('success', 'Autor eliminado correctamente.');
        } catch (\Exception $e) {
            return redirect()->route('autors.index', $this->getQueryParameters($request))
                ->with('error', 'Ocurrió un error al eliminar el autor.');
        }
    }

    private function getQueryParameters(Request $request)
    {
        return [
            'sort_by' => $request->input('sort_by', 'id'),
            'sort_order' => $request->input('sort_order', 'asc'),
            'search' => $request->input('search', '')
        ];
    }
}
