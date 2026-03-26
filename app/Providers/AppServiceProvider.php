<?php

namespace App\Providers;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Vite;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Required for older MySQL/MariaDB index length limits.
        Schema::defaultStringLength(191);

        // Optional local workaround for Windows/OpenSSL CA bundle issues.
        if ($this->app->environment('local') && env('AI_INSECURE_SSL', false)) {
            Http::globalOptions(['verify' => false]);
        }

        Vite::prefetch(concurrency: 3);
    }
}
