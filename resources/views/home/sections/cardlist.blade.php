{{-- // logica vuejs da applicare in laravel --}}
 <div class="container bg-for-card-list">
        <div class="centered">
            <div class="current-series">
                Current Series
            </div>
            <div class="card-container">
                @foreach ($comics as $comic)
                    <div class="card-container-for">
                        <div class="card">
                            <img src="{{ $comic['thumb']}}" alt="">
                        </div>
                        <div>
                            {{ $comic['series'] }}
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="load-more">
                Load More
            </div>
        </div>
    </div>
