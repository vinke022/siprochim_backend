<!-- Start Sidebar -->
<aside id="app-menu"
    class="hs-overlay fixed inset-y-0 start-0 z-60 hidden w-sidenav min-w-sidenav bg-slate-800 overflow-y-auto -translate-x-full transform transition-all duration-200 hs-overlay-open:translate-x-0 lg:bottom-0 lg:end-auto lg:z-30 lg:block lg:translate-x-0 rtl:translate-x-full rtl:hs-overlay-open:translate-x-0 rtl:lg:translate-x-0 print:hidden [--body-scroll:true] [--overlay-backdrop:true] lg:[--overlay-backdrop:false]">

    <div class="flex flex-col h-full">
        <!-- Sidenav Logo -->
        <div class="sticky top-0 flex h-topbar items-center justify-center px-6">
            <a href="{{ url('/') }}">
                <img src="{{ asset('assets/images/logo-white.png') }}" alt="logo" class="flex h-12">
            </a>
        </div>

        <div class="p-4 h-[calc(100%-theme('spacing.topbar'))] flex-grow" data-simplebar>
            <!-- Menu -->
            <ul class="admin-menu hs-accordion-group flex w-full flex-col gap-1">
                <li class="px-3 py-2 text-xs uppercase font-medium text-default-500">Menu</li>

                <!-- Dashboard -->
                <li class="menu-item hs-accordion">
                    <a href="{{ url('/') }}"
                        class="group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: Home -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M3 9.5 12 4l9 5.5"/><path d="M12 4v16"/>
                            <path d="M19.5 20h-15A1.5 1.5 0 0 1 3 18.5v-7A1.5 1.5 0 0 1 4.5 10h15A1.5 1.5 0 0 1 21 11.5v7A1.5 1.5 0 0 1 19.5 20Z"/>
                        </svg>
                        <span class="menu-text"> Dashboard </span>
                    </a>
                </li>

                <li class="px-3 py-2 text-xs uppercase font-medium text-default-500">Apps</li>

                <!-- Familles de produits -->
                <li class="menu-item hs-accordion">
                    <a href="javascript:void(0)"
                        class="hs-accordion-toggle group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: Layers -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="12 2 2 7 12 12 22 7 12 2"/><polyline points="2 17 12 22 22 17"/><polyline points="2 12 12 17 22 12"/>
                        </svg>
                        <span class="menu-text"> Familles </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="hs-accordion-content hidden w-full overflow-hidden transition-[height] duration-300">
                        <ul class="mt-1 space-y-1">
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.families.index') }}">
                                    Liste des familles
                                </a>
                            </li>
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.families.create') }}">
                                    Créer une famille
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Catégories -->
                <li class="menu-item hs-accordion">
                    <a href="javascript:void(0)"
                        class="hs-accordion-toggle group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: Folder -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M22 19V5a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v14"/><path d="M22 19H2"/><path d="m7 13 5 5 5-5"/>
                        </svg>
                        <span class="menu-text"> Catégories </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="hs-accordion-content hidden w-full overflow-hidden transition-[height] duration-300">
                        <ul class="mt-1 space-y-1">
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.product-categories.index') }}">
                                    Liste des catégories
                                </a>
                            </li>
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.product-categories.create') }}">
                                    Créer une catégorie
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Sous-catégories -->
                <li class="menu-item hs-accordion">
                    <a href="javascript:void(0)"
                        class="hs-accordion-toggle group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: Folders -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M5.4 3.4A2 2 0 0 1 7 3h10a2 2 0 0 1 2 2v16l-2-2H7a2 2 0 0 1-2-2V5a2 2 0 0 1 .4-1.6"/><path d="m8 6 4 4 4-4"/>
                        </svg>
                        <span class="menu-text"> Sous-catégories </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="hs-accordion-content hidden w-full overflow-hidden transition-[height] duration-300">
                        <ul class="mt-1 space-y-1">
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.product-subcategories.index') }}">
                                    Liste des sous-catégories
                                </a>
                            </li>
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.product-subcategories.create') }}">
                                    Créer une sous-catégorie
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Produits -->
                <li class="menu-item hs-accordion">
                    <a href="javascript:void(0)"
                        class="hs-accordion-toggle group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: Package -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 16V8a2 2 0 0 0-1.18-1.82l-7-3.12a2 2 0 0 0-1.64 0l-7 3.12A2 2 0 0 0 3 8v8a2 2 0 0 0 1.18 1.82l7 3.12a2 2 0 0 0 1.64 0l7-3.12A2 2 0 0 0 21 16Z"/><path d="m3.29 7 8.71 3.89a2 2 0 0 0 1.64 0L21 7"/><path d="M12 22V12"/>
                        </svg>
                        <span class="menu-text"> Produits </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="hs-accordion-content hidden w-full overflow-hidden transition-[height] duration-300">
                        <ul class="mt-1 space-y-1">
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.products.index') }}">
                                    Liste des produits
                                </a>
                            </li>
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.products.create') }}">
                                    Créer un produit
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Divider -->
                <li class="px-3 py-2 text-xs uppercase font-medium text-default-500">Contenu</li>

                <!-- Blog -->
                <li class="menu-item hs-accordion">
                    <a href="javascript:void(0)"
                        class="hs-accordion-toggle group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: FileText -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M9 9h6"/><path d="M9 13h6"/><path d="M9 17h6"/>
                            <rect width="18" height="18" x="3" y="3" rx="2"/><path d="M12 3v18"/>
                        </svg>
                        <span class="menu-text"> Blog </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="hs-accordion-content hidden w-full overflow-hidden transition-[height] duration-300">
                        <ul class="mt-1 space-y-1">
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.posts.index') }}">
                                    Liste des articles
                                </a>
                            </li>
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.posts.create') }}">
                                    Créer un article
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Divider Recrutement -->
                <li class="px-3 py-2 text-xs uppercase font-medium text-default-500">Recrutement</li>

                <!-- Offres d'emploi -->
                <li class="menu-item hs-accordion">
                    <a href="javascript:void(0)"
                        class="hs-accordion-toggle group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5 hs-accordion-active:bg-default-100/5 hs-accordion-active:text-default-100">
                        <!-- Lucide: Briefcase -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect width="20" height="14" x="2" y="7" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/>
                            <line x1="12" x2="12" y1="12" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/>
                        </svg>
                        <span class="menu-text"> Offres d'emploi </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="hs-accordion-content hidden w-full overflow-hidden transition-[height] duration-300">
                        <ul class="mt-1 space-y-1">
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.job-offers.index') }}">
                                    Liste des offres
                                </a>
                            </li>
                            <li class="menu-item">
                                <a class="flex items-center gap-x-3.5 rounded-md px-3 py-1.5 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5"
                                    href="{{ route('admin.job-offers.create') }}">
                                    Publier une offre
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Candidatures -->
                <li class="menu-item">
                    <a href="{{ route('admin.job-applications.index') }}"
                        class="group flex items-center gap-x-3.5 rounded-md px-3 py-2 text-sm font-medium text-default-400 transition-all hover:bg-default-100/5">
                        <!-- Lucide: FileText -->
                        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/>
                            <polyline points="14 2 14 8 20 8"/><line x1="16" x2="8" y1="13" y2="13"/><line x1="16" x2="8" y1="17" y2="17"/><line x1="10" x2="8" y1="9" y2="9"/>
                        </svg>
                        <span class="menu-text"> Candidatures reçues </span>
                    </a>
                </li>
        </div>

    </div>
</aside>
<!-- End Sidebar -->
