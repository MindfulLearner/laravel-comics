<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        @vite('resources/js/app.js')
    </head>
    <body>

 <!-- Usiamo include per aggiungere i comoponenti suddivisi tramite componenti in realta piu sezionic -->
 <!-- qui ci saranno navbar... -->
@include('home/homeheader')

@include('home/homejumbotron')

@include('home/homecardlist')

@include('home/homebluestripe')

@include('home/homefooter')

@include('home/homesottofooter')

    </body>
</html>
