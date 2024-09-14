<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Libro extends Model
{
    use HasFactory;

    protected $table = 'libros';

    static $rules = [
        'titulo',
        'autor_id',
        'anio',
        'genero',
        'idioma',
        'descripcion',
    ];

    protected $fillable = [
        'titulo',
        'autor_id',
        'anio',
        'genero',
        'idioma',
        'descripcion',
    ];

    public function autor()
    {
        return $this->belongsTo(Autor::class, 'autor_id');
    }

}
