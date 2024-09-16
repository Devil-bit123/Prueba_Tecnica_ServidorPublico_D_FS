@extends('voyager::master')

@section('content')
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>


    <div class="card">
        <h5 class="card-title">Estadisticas de covid 19</h5>
        <div class="card-body">
            <div id="main" style="width: 900px; height: 400px;"></div>
        </div>
    </div>

    <script>
        const data = @json($data);

        function formatDate(dateStr) {
            const year = dateStr.substring(0, 4);
            const month = dateStr.substring(4, 6);
            const day = dateStr.substring(6, 8);
            return `${year}-${month}-${day}`;
        }

        const dates = data.map(item => formatDate(item.date.toString()));
        const positiveIncrease = data.map(item => item.positiveIncrease);
        const negativeIncrease = data.map(item => item.negativeIncrease);
        const deathIncrease = data.map(item => item.deathIncrease);
        const hospitalizedIncrease = data.map(item => item.hospitalizedIncrease);

        // Inicializa el gráfico
        var myChart = echarts.init(document.getElementById('main'));

        // Configuración del gráfico
        var option = {
            grid: {
                bottom: 100
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['Positive Increase', 'Negative Increase', 'Death Increase', 'Hospitalized Increase']
            },
            xAxis: {
                type: 'category',
                data: dates,
                axisLabel: {
                    rotate: 90
                }
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                    name: 'Positive Increase',
                    type: 'line',
                    data: positiveIncrease
                },
                {
                    name: 'Negative Increase',
                    type: 'line',
                    data: negativeIncrease
                },
                {
                    name: 'Death Increase',
                    type: 'line',
                    data: deathIncrease
                },
                {
                    name: 'Hospitalized Increase',
                    type: 'line',
                    data: hospitalizedIncrease
                }
            ]
        };

        myChart.setOption(option);
    </script>
@endsection
