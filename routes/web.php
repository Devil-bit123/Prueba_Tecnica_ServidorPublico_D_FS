<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AutorController;

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

});
