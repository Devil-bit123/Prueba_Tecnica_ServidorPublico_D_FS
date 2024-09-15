<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AutorController;
use App\Http\Controllers\LibroController;
use App\Models\Libro;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/admin');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::group(['prefix' => 'autores'], function () {
        //Autores
        Route::get('/', [AutorController::class, 'index'])->name('autors.index');
        Route::get('/create', [AutorController::class, 'create'])->name('autors.create');
        Route::post('/store', [AutorController::class, 'store'])->name('autors.store');
        Route::get('/show/{autor}', [AutorController::class, 'show'])->name('autors.read');
        Route::get('/edit/{autor}', [AutorController::class, 'edit'])->name('autors.edit');
        Route::put('/update/{autor}', [AutorController::class, 'update'])->name('autors.update');
        Route::delete('/delete/{autor}', [AutorController::class, 'destroy'])->name('autors.delete');
    });

    // Route::group(['prefix' => 'libros'], function () {
    //     //Autores
    //     Route::get('/', [LibroController::class, 'index'])->name('libros.index');
    //     Route::get('/create', [LibroController::class, 'create'])->name('libros.create');
    //     Route::post('/store', [LibroController::class, 'store'])->name('libros.store');
    //     Route::get('/show/{libro}', [LibroController::class, 'show'])->name('libros.read');
    //     Route::get('/edit/{libro}', [LibroController::class, 'edit'])->name('libros.edit');
    //     Route::put('/update/{libro}', [LibroController::class, 'update'])->name('libros.update');
    //     Route::delete('/delete/{libro}', [LibroController::class, 'destroy'])->name('libros.delete');
    // });

    Route::group(['prefix' => 'libros'], function () {
        Route::get('/', [LibroController::class, 'index'])->name('voyager.libros.index');
        Route::get('/create', [LibroController::class, 'create'])->name('voyager.libros.create');
        Route::post('/store', [LibroController::class, 'store'])->name('voyager.libros.store');
        Route::get('/show/{libro}', [LibroController::class, 'show'])->name('voyager.libros.read');
        Route::get('/edit/{libro}', [LibroController::class, 'edit'])->name('voyager.libros.edit');
        Route::put('/update/{libro}', [LibroController::class, 'update'])->name('voyager.libros.update');
        Route::delete('/delete/{libro}', [LibroController::class, 'destroy'])->name('voyager.libros.delete');
    });



});
