<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Logs
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        \App\Http\Controllers\LogsController::saveLog($request->user()->id, $request->url());

        return $next($request);
    }
}
