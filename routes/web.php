<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth:sanctum', 'verified', 'banned_users'])->get('/dashboard', function () {
    return Inertia\Inertia::render('Dashboard');
})->name('dashboard');

Route::prefix('dashboard')->middleware(['auth', 'banned_users'])->group(function(){

    Route::resource('users', 'UsersController');
    Route::put('users/change_status/{user}', 'UsersController@changeStatus')->name('users.change_status');

    Route::get('logs', 'LogsController@index')->name('logs');

    Route::resource('diezmos', 'TithesController', ['except' => ['show']]);
    Route::post('diezmos/completar', 'TithesController@complete')->name('diezmos.complete');

    Route::resource('transferencias', 'TransfersController', ['except' => ['create', 'store', 'edit', 'update']]);
});
