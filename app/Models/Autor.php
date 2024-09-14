<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Autor extends Model
{
    use HasFactory;

    protected $table = 'autors';

    static $rules=[
        'nombres'=>'required',
        'fechaNacimiento'=>'required|date_format:Y-m-d|before:today',
    ];

    protected $fillable = [
        'nombres',
        'fechaNacimiento',
    ];

    public function libros()
    {
        return $this->hasMany(Libro::class, 'autor_id');
    }

}
