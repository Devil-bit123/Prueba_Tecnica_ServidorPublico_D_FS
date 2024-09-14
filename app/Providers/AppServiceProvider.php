<?php

namespace App\Providers;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->register();

        // Gate::define('add_autors', function ($user) {
        //     // Verifica si el usuario tiene el permiso
        //     if ($user->hasPermissionTo('add_autors')) {
        //         return true;
        //     } else {
        //         return false;
        //     }
        // });

        Gate::define('check_permission', function ($user, $permissionKey) {
            // Verifica si el usuario tiene el permiso especificado
            return $user->hasPermissionTo($permissionKey);
        });



    }

}
