<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CovidDashboardView;
use Illuminate\Support\Facades\Http;

class CovidDashboardViewController extends Controller
{
    /**
     * Este controlador maneja la visualización del dashboard de COVID.
     * Intenta obtener la primera instancia del dashboard y verifica su validez.
     * Si es válido, realiza una solicitud GET a la URL del dashboard, maneja posibles errores y retorna la vista correspondiente con los datos obtenidos
     * o un mensaje de error si la solicitud falla.
     */

    public function index()
    {
        // Intentar obtener la primera instancia del dashboard, si no se encuentra, manejar el error.
        $dashboard = CovidDashboardView::first();

        // Verificar si el dashboard existe y tiene una URL válida
        if (!$dashboard || empty($dashboard->url)) {
            return view('vendor.voyager.covid-dashboard-views.browse')
                ->withErrors('No se encontró un dashboard o la URL es inválida.');
        }

        try {
            // Hacer la solicitud GET a la URL del dashboard
            $response = Http::get($dashboard->url);

            // Verificar si la solicitud fue exitosa
            if ($response->successful()) {
                // Obtener los datos de la respuesta
                $data = $response->json();

                // Retornar la vista con los datos obtenidos
                return view('vendor.voyager.covid-dashboard-views.browse', ['data' => $data]);
            } else {
                // Manejar el error específico de la solicitud
                return view('vendor.voyager.covid-dashboard-views.browse')
                    ->withErrors('Error al obtener datos de la API. Código de estado: ' . $response->status());
            }
        } catch (\Exception $e) {
            // Manejar cualquier excepción (como problemas de conexión o tiempos de espera)
            return view('vendor.voyager.covid-dashboard-views.browse')
                ->withErrors('Hubo un problema al conectarse a la API: ' . $e->getMessage());
        }
    }
}
