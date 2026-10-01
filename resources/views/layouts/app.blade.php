<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>@yield('title') | SIPROCHIM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Myrathemes" name="author">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('favicon.png') }}" type="image/png">
    
    @include('partials.head-css')
    @stack('css')
</head>

<body>
    <div class="wrapper">

        @include('partials.sidenav')

        <!-- Start Page Content here -->
        <div class="page-content">

            @include('partials.topbar')

            <main>
                {{-- @include('includes.successOrError') --}}
                @yield('content')
            </main>

            @include('partials.footer')

        </div>
        <!-- End Page content -->

    </div>

    @include('partials.footer-scripts')

    {{-- <!-- Apexcharts js -->
    <script src="{{ asset('assets/libs/apexcharts/apexcharts.min.js') }}"></script>

    <!-- Morris Js Chart -->
    <script src="{{ asset('assets/libs/morris.js/morris.min.js') }}"></script>

    <script src="{{ asset('assets/libs/raphael/raphael.min.js') }}"></script>

    <!-- Dashboard Project Page js -->
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script> --}}

    @stack('js')
</body>

</html>