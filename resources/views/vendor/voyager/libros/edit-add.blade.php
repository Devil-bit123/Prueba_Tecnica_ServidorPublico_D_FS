@extends('voyager::master')

@section('content')
    <div class="container">

        <div class="card w-75 mb-3">
            <div class="card-body">
                <h5 class="card-title">Autor </h5>

                @include('vendor.voyager.libros.form', [
                    'method' => $method ?? 'U',
                    'libro' => $libro ?? null,
                    'autors' => $autors ?? null,
                ])

            </div>
        </div>

    </div>
@endsection
