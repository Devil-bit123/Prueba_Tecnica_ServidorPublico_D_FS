<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CovidDashboardView;
use Illuminate\Support\Facades\Http;

class CovidDashboardViewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // //
        // $dashboard=CovidDashboardView::firstOrDefault();
        // $response = Http::get($dashboard->url);
        //  if ($response->successful()) {
        //     // Obtener los datos de la respuesta
        //     $data = $response->json();

        //     return view('');
        //     // Retornar la vista con la data data o hacer algo con ella

        // } else {
        //     // Manejar el error
        //     // Retornar la vista con la error data o hacer algo con ella
        //     return view('');
        // }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CovidDashboardView  $covidDashboardView
     * @return \Illuminate\Http\Response
     */
    public function show(CovidDashboardView $covidDashboardView)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CovidDashboardView  $covidDashboardView
     * @return \Illuminate\Http\Response
     */
    public function edit(CovidDashboardView $covidDashboardView)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CovidDashboardView  $covidDashboardView
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CovidDashboardView $covidDashboardView)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CovidDashboardView  $covidDashboardView
     * @return \Illuminate\Http\Response
     */
    public function destroy(CovidDashboardView $covidDashboardView)
    {
        //
    }
}
