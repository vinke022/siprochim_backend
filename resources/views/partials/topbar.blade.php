<!-- Topbar Start -->
<header class="app-header sticky top-0 z-50 min-h-topbar flex items-center bg-white">
    <div class="px-6 w-full flex items-center justify-between gap-4">
        <div class="flex items-center gap-5">
            <!-- Sidenav Menu Toggle Button -->
            <button
                class="flex items-center text-default-500 rounded-full cursor-pointer p-2 bg-white border border-default-200 hover:bg-primary/15 hover:text-primary hover:border-primary/5 transition-all"
                data-hs-overlay="#app-menu" aria-label="Toggle navigation">
                <i class="i-lucide-align-left text-2xl"></i>
            </button>

            <!-- Topbar Brand Logo -->
            <a href="{{ url('/') }}" class="md:hidden flex">
                <img src="{{ asset('assets/images/logo-sm.png') }}" class="h-5" alt="Small logo">
            </a>
        </div>
        
        <div class="flex items-center gap-5">
            <!-- Profile Dropdown Button -->
            <div class="relative">
                <div class="hs-dropdown relative inline-flex [--placement:bottom-right]">
                    <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                        <div>{{ Auth::user()->name }}</div>
                    </button>
                    <button type="button" class="hs-dropdown-toggle">
                        <img src="{{ asset('assets/images/users/profile_sipro.png') }}" alt="user-image" class="rounded-full h-10">
                    </button>
                    <div
                        class="hs-dropdown-menu duration mt-2 min-w-48 rounded-lg border border-default-200 bg-white p-2 opacity-0 shadow-md transition-[opacity,margin] hs-dropdown-open:opacity-100 hidden">
                
                        <a class="flex items-center py-2 px-3 rounded-md text-sm text-default-800 hover:bg-default-100"
                           href="{{ route('profile.edit') }}">
                            Profile
                        </a>
                
                        <hr class="my-2 -mx-2">
                
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit"
                                class="flex items-center py-2 px-3 rounded-md text-sm text-default-800 hover:bg-default-100 w-full text-left">
                                Se deconnecter
                            </button>
                        </form>
                    </div>
                </div>                
            </div>
        </div>
    </div>
</header>
<!-- Topbar End -->
