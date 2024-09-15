@extends('voyager::master')

@section('content')

    @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    @if (session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="container">

        <div class="card w-75 mb-3">
            <div class="card-body">

                @switch($method)
                    @case('V')
                        <h5 class="card-title">Ver {{ $libro->titulo }}</h5>

                        <form class="row g-3">
                            <div class="col-auto">
                                <label for="inputTitle" class="visually-hidden">Titulo</label>
                                <input type="text" readonly class="form-control-plaintext" id="inputTitle"
                                    value="{{ $libro->titulo }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputAutor" class="visually-hidden">Autor</label>
                                <input type="text" readonly class="form-control-plaintext" id="inputAutor"
                                    value="{{ $libro->autor->nombres }}">
                            </div>


                            <div class="col-auto">
                                <label for="inputAnio" class="visually-hidden">Año</label>
                                <input type="text" readonly class="form-control-plaintext" id="inputAnio"
                                    value="{{ $libro->anio }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputGenero" class="visually-hidden">Genero</label>
                                <input type="text" readonly class="form-control-plaintext" id="inputGenero"
                                    value="{{ $libro->genero }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputIdioma" class="visually-hidden">Idioma</label>
                                <input type="text" readonly class="form-control-plaintext" id="inputIdioma"
                                    value="{{ $libro->idioma }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputDescripcion" class="visually-hidden">Descripcion</label>
                                <textarea readonly class="form-control-plaintext" id="inputDescripcion" value="">{{ $libro->descripcion }}</textarea>
                            </div>

                            <div class="col-auto">
                                <a style="text-decoration: none" href="{{ route('voyager.libros.index') }}" type="button"
                                    class="btn btn-info">Regresar</a>
                            </div>
                        </form>
                    @break

                    @case('U')
                        <h5 class="card-title">Editar {{ $libro->titulo }}</h5>

                        <form class="row g-3" action="{{ route('voyager.libros.update', $libro->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="col-auto">
                                <label for="inputTitle" class="visually-hidden">Titulo</label>
                                <input type="text" name="titulo" class="form-control-plaintext" id="inputTitle"
                                    value="{{ $libro->titulo }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputAutor" class="visually-hidden">Autor</label>

                                <select name="autor_id" class="form-select" required>
                                    <option value="">Selecciona un autor</option>
                                    @foreach ($autors as $autor)
                                        <option value="{{ $autor->id }}"
                                            {{ isset($libro->autor) && $libro->autor->id == $autor->id ? 'selected' : '' }}>
                                            {{ $autor->nombres }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-auto">
                                <label for="inputAnio" class="visually-hidden">Año</label>
                                <input type="date" name="anio" class="form-control-plaintext" id="inputAnio"
                                    value="{{ $libro->anio }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputGenero" class="visually-hidden">Genero</label>
                                <input type="text" name="genero" class="form-control-plaintext" id="inputGenero"
                                    value="{{ $libro->genero }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputIdioma" class="visually-hidden">Idioma</label>
                                <input type="text" name="idioma" class="form-control-plaintext" id="inputIdioma"
                                    value="{{ $libro->idioma }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputDescripcion" class="visually-hidden">Descripcion</label>
                                <textarea name="descripcion" class="form-control-plaintext" id="inputDescripcion" value="">{{ $libro->descripcion }}</textarea>
                            </div>

                            <div class="col-auto">
                                <button style="text-decoration: none" type="submit" class="btn btn-warning">Editar</button>
                                <a style="text-decoration: none" href="{{ route('voyager.libros.index') }}" type="button"
                                    class="btn btn-info">Regresar</a>
                            </div>
                        </form>
                    @break

                    @default
                        <h5 class="card-title">Agregar autor</h5>
                        <form class="row g-3" action="{{ route('voyager.libros.store') }}" method="POST">
                            @csrf
                            @method('POST')
                            <div class="col-auto">
                                <label for="inputTitle" class="visually-hidden">Titulo</label>
                                <input type="text" name="titulo" class="form-control-plaintext" id="inputTitle">
                            </div>

                            <div class="col-auto">
                                <label for="inputAutor" class="visually-hidden">Autor</label>

                                <select name="autor_id" class="form-select" required>
                                    <option value="">Selecciona un autor</option>
                                    @foreach ($autors as $autor)
                                        <option value="{{ $autor->id }}"
                                            {{ isset($libro->autor) && $libro->autor->id == $autor->id ? 'selected' : '' }}>
                                            {{ $autor->nombres }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-auto">
                                <label for="inputAnio" class="visually-hidden">Año</label>
                                <input type="date" name="anio" class="form-control-plaintext" id="inputAnio">
                            </div>

                            <div class="col-auto">
                                <label for="inputGenero" class="visually-hidden">Genero</label>
                                <input type="text" name="genero" class="form-control-plaintext" id="inputGenero">
                            </div>

                            <div class="col-auto">
                                <label for="inputIdioma" class="visually-hidden">Idioma</label>
                                <input type="text" name="idioma" class="form-control-plaintext" id="inputIdioma">
                            </div>

                            <div class="col-auto">
                                <label for="inputDescripcion" class="visually-hidden">Descripcion</label>
                                <textarea name="descripcion" class="form-control-plaintext" id="inputDescripcion"></textarea>
                            </div>

                            <div class="col-auto">
                                <button style="text-decoration: none" type="submit" class="btn btn-warning">Agregar</button>
                                <a style="text-decoration: none" href="{{ route('voyager.libros.index') }}" type="button"
                                    class="btn btn-info">Regresar</a>
                            </div>
                        </form>
                @endswitch

            </div>
        </div>

    </div>
@endsection
