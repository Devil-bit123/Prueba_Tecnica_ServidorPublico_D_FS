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
                <form method="GET" action="{{ route('autors.index') }}" class="mb-3">
                    <div class="form-group">
                        <input type="text" name="search" value="{{ $search }}" class="form-control"
                            placeholder="Buscar por nombre">
                    </div>
                    <button type="submit" class="btn btn-primary">Buscar</button>
                </form>

                @can('check_permission', 'add_autors')
                    <a type="button" href="{{ route('autors.create') }}" class="btn btn-success">Agregar</a>
                @endcan

                <!-- Tabla de datos -->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">
                                <a
                                    href="{{ route('autors.index', ['sort_by' => 'id', 'sort_order' => $sortOrder == 'asc' ? 'desc' : 'asc', 'search' => $search]) }}">
                                    #
                                    @if ($sortBy == 'id')
                                        <i class="fa {{ $sortOrder == 'asc' ? 'fa-chevron-up' : 'fa-chevron-down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('autors.index', ['sort_by' => 'nombres', 'sort_order' => $sortOrder == 'asc' ? 'desc' : 'asc', 'search' => $search]) }}">
                                    Nombres
                                    @if ($sortBy == 'nombres')
                                        <i class="fa {{ $sortOrder == 'asc' ? 'fa-chevron-up' : 'fa-chevron-down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                <a
                                    href="{{ route('autors.index', ['sort_by' => 'fechaNacimiento', 'sort_order' => $sortOrder == 'asc' ? 'desc' : 'asc', 'search' => $search]) }}">
                                    Fecha de Nacimiento
                                    @if ($sortBy == 'fechaNacimiento')
                                        <i class="fa {{ $sortOrder == 'asc' ? 'fa-chevron-up' : 'fa-chevron-down' }}"></i>
                                    @endif
                                </a>
                            </th>
                            <th scope="col">
                                Libros
                            </th>
                            <th scope="col">
                                Acciones
                            </th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($autors as $autor)
                            <tr>
                                <td>{{ $autor->id }}</td>
                                <td>{{ $autor->nombres }}</td>
                                <td>{{ $autor->fechaNacimiento }}</td>
                                <td>
                                    @if ($autor->libros->isNotEmpty())
                                        @foreach ($autor->libros as $libro)
                                            <p>{{ $libro->titulo }}</p>
                                        @endforeach
                                    @else
                                        <strong>
                                            <p>Aún no se ha asignado un libro a este autor</p>
                                        </strong>
                                    @endif
                                </td>

                                <td>

                                    @can('check_permission', 'read_autors')
                                        <a style="text-decoration: none"
                                            href="{{ route('autors.read', ['autor' => $autor->id]) }}" type="button"
                                            class="btn btn-info">Ver</a>
                                    @endcan

                                    @can('check_permission', 'edit_autors')
                                        <a style="text-decoration: none"
                                            href="{{ route('autors.edit', ['autor' => $autor->id]) }}" type="button"
                                            class="btn btn-warning">Editar</a>
                                    @endcan

                                    @can('check_permission', 'delete_autors')
                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
                                            data-target="#myModal" data-id="{{ $autor->id }}">Eliminar</button>
                                    @endcan

                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                <!-- Enlaces de paginación -->
                {{ $autors->appends(['sort_by' => $sortBy, 'sort_order' => $sortOrder, 'search' => $search])->links() }}

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
            var autorId = button.data('id');
            // Construye la URL para la eliminación
            var actionUrl = '{{ route('autors.delete', ':id') }}';
            actionUrl = actionUrl.replace(':id', autorId);
            // Establece la URL de acción del formulario
            var form = $(this).find('form');
            form.attr('action', actionUrl);
        });
    </script>
@endsection
