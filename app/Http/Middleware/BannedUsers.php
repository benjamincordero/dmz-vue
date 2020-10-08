<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class BannedUsers
{
    public function handle(Request $request, Closure $next)
    {
        if($request->user()->status){
            return $next($request);
        }else{
           abort(403);
        }
    }
}
