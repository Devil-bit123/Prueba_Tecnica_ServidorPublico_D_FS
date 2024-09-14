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
                        <h5 class="card-title">Ver {{ $autor->nombres }}</h5>

                        <form class="row g-3">
                            <div class="col-auto">
                                <label for="inputName" class="visually-hidden">Nombres</label>
                                <input type="text" readonly class="form-control-plaintext" id="inputName"
                                    value="{{ $autor->nombres }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputDate" class="visually-hidden">Fecha de Nacimiento</label>
                                <input type="date" readonly class="form-control-plaintext" id="inputDate"
                                    value="{{ $autor->fechaNacimiento }}">
                            </div>

                            <div class="col-auto">
                                <a style="text-decoration: none" href="{{ route('autors.index') }}" type="button"
                                    class="btn btn-info">Regresar</a>
                            </div>
                        </form>
                    @break

                    @case('U')
                        <h5 class="card-title">Editar {{ $autor->nombres }}</h5>
                        <form class="row g-3" action="{{ route('autors.update', $autor->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="col-auto">
                                <label for="inputName" class="visually-hidden">Nombres</label>
                                <input type="text" class="form-control-plaintext" id="inputName" name="nombres"
                                    placeholder="{{ $autor->nombres }}">
                            </div>

                            <div class="col-auto">
                                <label for="inputDate" class="visually-hidden">Fecha de Nacimiento</label>
                                <input type="date" class="form-control-plaintext" id="inputDate" name="fechaNacimiento"
                                    placeholder="{{ $autor->fechaNacimiento }}" value="{{ $autor->fechaNacimiento }}">
                            </div>

                            <div class="col-auto">
                                <button style="text-decoration: none" type="submit" class="btn btn-warning">Editar</button>
                                <a style="text-decoration: none" href="{{ route('autors.index') }}" type="button"
                                    class="btn btn-info">Regresar</a>
                            </div>
                        </form>
                    @break

                    @default

                    <h5 class="card-title">Agregar autor</h5>
                    <form class="row g-3" action="{{ route('autors.store') }}" method="POST">
                        @csrf
                        @method('POST')
                        <div class="col-auto">
                            <label for="inputName" class="visually-hidden">Nombres</label>
                            <input type="text" name="nombres" class="form-control-plaintext" id="inputName">
                        </div>

                        <div class="col-auto">
                            <label for="inputDate" class="visually-hidden">Fecha de Nacimiento</label>
                            <input type="date" name="fechaNacimiento" class="form-control-plaintext" id="inputDate">
                        </div>

                        <div class="col-auto">
                            <button style="text-decoration: none" type="submit" class="btn btn-primary">Agregar</button>
                            <a style="text-decoration: none" href="{{ route('autors.index') }}" type="button"
                                class="btn btn-info">Regresar</a>
                        </div>
                    </form>


                @endswitch

            </div>
        </div>

    </div>
@endsection
