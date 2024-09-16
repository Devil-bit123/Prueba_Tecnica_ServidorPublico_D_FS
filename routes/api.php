<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthApiController;
use App\Http\Controllers\ModulesController;
use App\Http\Controllers\AutorApiController;
use App\Http\Controllers\CovidDashboardViewController;
use App\Http\Controllers\LibroApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:sanctum')->get('/user', [AuthApiController::class, 'userInfo']);

Route::post('register', [AuthApiController::class, 'register']);

Route::post('login', [AuthApiController::class, 'login']);

Route::middleware('auth:sanctum')->post('/logout', [AuthApiController::class, 'logout']);

Route::group(['prefix' => 'autores', 'middleware' => 'auth:sanctum'], function () {
    Route::get('/', [AutorApiController::class, 'index'])->name('api.autors.index');
    Route::post('/', [AutorApiController::class, 'store'])->name('api.autors.store');
    Route::get('/{autor}', [AutorApiController::class, 'show'])->name('api.autors.show');
    Route::put('/{autor}', [AutorApiController::class, 'update'])->name('api.autors.update');
    Route::delete('/{autor}', [AutorApiController::class, 'destroy'])->name('api.autors.destroy');
});

Route::group(['prefix' => 'libros', 'middleware' => 'auth:sanctum'], function () {
    Route::get('/', [LibroApiController::class, 'index'])->name('api.libros.index');
    Route::post('/', [LibroApiController::class, 'store'])->name('api.libros.store');
    Route::get('/{libro}', [LibroApiController::class, 'show'])->name('api.libros.show');
    Route::put('/{libro}', [LibroApiController::class, 'update'])->name('api.libros.update');
    Route::delete('/{libro}', [LibroApiController::class, 'destroy'])->name('api.libros.destroy');
});

Route::group(['prefix' => 'covid-dashboard', 'middleware' => 'auth:sanctum'], function () {
    Route::get('/', [CovidDashboardViewController::class, 'index'])->name('api.covid-dashboard.index');
});


Route::group(['prefix' => 'modules', 'middleware' => 'auth:sanctum'], function () {
    Route::get('/', [ModulesController::class, 'index'])->name('api.modules.index');
});


