<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CovidDashboardView extends Model
{
    use HasFactory;
    protected $table = 'covid_dashboard_views';

    static $rules=[
        'url'=>'required',
    ];

}
