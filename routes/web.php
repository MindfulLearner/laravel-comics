<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    $comics = config('comicsdata');


    return view('welcome', compact('comics'));
});
