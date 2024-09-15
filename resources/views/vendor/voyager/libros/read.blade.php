@extends('voyager::master')

@section('content')
    <div class="container">

        <div class="card w-75 mb-3">
            <div class="card-body">
                <h5 class="card-title">Autor </h5>

                @include('vendor.voyager.libros.form', ['method' => 'V', 'libro' => $libro])

            </div>
        </div>

    </div>
@endsection
