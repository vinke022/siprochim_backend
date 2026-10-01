@extends('layouts.app')

@section('title', 'Dashboard')

@push('css')
    
@endpush

@section('content')
    @include("partials.page-title", ['subtitle' => 'Menu', 'title' => 'Dashboard'])
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mt-8">
        <div>
            <div id="total-order" style="height: 100px;"></div>
        </div>
        <div>
            <div id="total-sale" style="height: 100px;"></div>
        </div>
        <div>
            <div id="total-visits" style="height: 100px;"></div>
        </div>
        <div>
            <div id="chart4" style="height: 100px;"></div>
        </div>
    </div>
@endsection

@push('js')

@endpush