@extends('voyager::master')

@section('content')
    <div class="container">

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

        <div class="card w-75 mb-3">
            <div class="card-body">
                <h5 class="card-title">Autores</h5>
                <!-- Formulario de búsqueda -->
                <form method="GET" action="{{ route('libros.index') }}" class="mb-3">

                    <div style="display: flex; flex-direction:row">
                        <select class="form-select" class="form-control" name="filter" required>
                            <option value="" disabled selected>Filtro</option>
                            <option value="autor">Autor</option>
                            <option value="idioma">Idioma</option>
                            <option value="titulo">Titulo</option>
                        </select>

                        <input type="text" name="search" required class="form-control" placeholder="Filtro">
                    </div>
                    <button type="submit" class="btn btn-primary">Buscar</button>
                    <a href="{{ route('libros.index') }}" class="btn btn-warning">Borrar filtros</a>
                </form>

                @can('check_permission', 'add_libros')
                    <a style="text-decoration: none" href="{{ route('libros.create') }}" type="button"
                        class="btn btn-info">Crear</a>
                @endcan

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">
                                <a
                                    href="{{ route('libros.index', ['sort' => 'id', 'direction' => request('direction') == 'asc' ? 'desc' : 'asc']) }}">
                                    #
                                    @if (request('sort') == 'id')
                                        <i class="fa fa-sort-{{ request('direction') == 'asc' ? 'up' : 'down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('libros.index', ['sort' => 'titulo', 'direction' => request('direction') == 'asc' ? 'desc' : 'asc']) }}">
                                    Título
                                    @if (request('sort') == 'titulo')
                                        <i class="fa fa-sort-{{ request('direction') == 'asc' ? 'up' : 'down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('libros.index', ['sort' => 'autor', 'direction' => request('direction') == 'asc' ? 'desc' : 'asc']) }}">
                                    Autor
                                    @if (request('sort') == 'autor')
                                        <i class="fa fa-sort-{{ request('direction') == 'asc' ? 'up' : 'down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('libros.index', ['sort' => 'anio', 'direction' => request('direction') == 'asc' ? 'desc' : 'asc']) }}">
                                    Año
                                    @if (request('sort') == 'anio')
                                        <i class="fa fa-sort-{{ request('direction') == 'asc' ? 'up' : 'down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('libros.index', ['sort' => 'genero', 'direction' => request('direction') == 'asc' ? 'desc' : 'asc']) }}">
                                    Genero
                                    @if (request('sort') == 'genero')
                                        <i class="fa fa-sort-{{ request('direction') == 'asc' ? 'up' : 'down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('libros.index', ['sort' => 'idioma', 'direction' => request('direction') == 'asc' ? 'desc' : 'asc']) }}">
                                    Idioma
                                    @if (request('sort') == 'idioma')
                                        <i class="fa fa-sort-{{ request('direction') == 'asc' ? 'up' : 'down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                Descripcion
                            </th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($libros as $libro)
                            <tr>
                                <td>{{ $libro->id }}</td>
                                <td>{{ $libro->titulo }}</td>
                                <td>{{ $libro->autor->nombres }}</td>
                                <td>{{ $libro->anio }}</td>
                                <td>{{ $libro->genero }}</td>
                                <td>{{ $libro->idioma }}</td>
                                <td>{{ $libro->descripcion }}</td>
                                <td>
                                    @can('check_permission', 'read_libros')
                                        <a style="text-decoration: none"
                                            href="{{ route('libros.read', ['libro' => $libro->id]) }}" type="button"
                                            class="btn btn-info">Ver</a>
                                    @endcan

                                    @can('check_permission', 'edit_libros')
                                        <a style="text-decoration: none"
                                            href="{{ route('libros.edit', ['libro' => $libro->id]) }}" type="button"
                                            class="btn btn-warning">Editar</a>
                                    @endcan

                                    @can('check_permission', 'delete_libros')
                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
                                            data-target="#myModal" data-id="{{ $libro->id }}">Eliminar</button>
                                    @endcan
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                <!-- Enlaces de paginación -->
                {{ $libros->appends(request()->except('page'))->links() }}

            </div>
        </div>

    </div>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirmación</h4>
                </div>
                <div class="modal-body">
                    <p>¿Está seguro de eliminar el contenido?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <form action="" method="POST" id="delete-form">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </form>

                </div>
            </div>

        </div>
    </div>

@endsection

@section('javascript')
    <script>
        // Escucha el evento de apertura del modal
        $('#myModal').on('show.bs.modal', function(event) {
            // Obtén el botón que activó el modal
            var button = $(event.relatedTarget);
            // Obtén el ID del autor desde el atributo data-id
            var libroId = button.data('id');
            // Construye la URL para la eliminación
            var actionUrl = '{{ route('libros.delete', ':id') }}';
            actionUrl = actionUrl.replace(':id', libroId);
            // Establece la URL de acción del formulario
            var form = $(this).find('form');
            form.attr('action', actionUrl);
        });
    </script>
@endsection
