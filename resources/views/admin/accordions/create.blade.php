@extends('layouts.app')

@section('title', 'Ajouter / Modifier un accordéon' . $product->name)

@push('css')
<link
    href="{{ asset('assets/libs/quill/quill.core.css') }}"
    rel="stylesheet"
    type="text/css"
/>
<link
    href="{{ asset('assets/libs/quill/quill.bubble.css') }}"
    rel="stylesheet"
    type="text/css"
/>
<link
    href="{{ asset('assets/libs/quill/quill.snow.css') }}"
    rel="stylesheet"
    type="text/css"
/>
@endpush

@section('content')
<div class="card max-w-lg mx-auto">
    <div class="p-6">
        <h4 class="card-title mb-4">
            {{ isset($accordion) ? 'Modifier l\'accordéon' : 'Ajouter un accordéon' }}
        </h4>
        <form action="{{ isset($accordion) 
            ? route('admin.products.accordions.update', [$product, $accordion]) 
            : route('admin.products.accordions.store', $product) 
        }}" method="POST" class="quill-form">
            @csrf
            @if(isset($accordion))
                @method('PUT')
            @endif

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Titre</label>
                <input type="text" name="title" class="form-input" value="{{ old('title', $accordion->title ?? '') }}" required>
                @error('title')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Contenu</label>
                <!-- Zone Quill -->
                <div id="text-editor-accordion" style="height: 300px;">{!! old('content', $accordion->content ?? '') !!}</div>
                <!-- Champ caché pour envoyer le contenu HTML à Laravel -->
                <input type="hidden" name="content" id="content-input-accordion">
                @error('content')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>

            <button type="submit" class="btn bg-primary text-white">
                {{ isset($accordion) ? 'Mettre à jour' : 'Ajouter' }}
            </button>
        </form>
    </div>
</div>
@endsection

@push('js')
<script src="{{ asset('assets/libs/quill/quill.min.js') }}"></script>
<script src="{{ asset('assets/js/pages/form-editor.js') }}"></script>
<script>
    var quill = new Quill('#text-editor-accordion', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'font': [] }],
                [{ 'size': [] }],
                ['bold', 'italic', 'underline', 'strike'],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'script': 'super' }, { 'script': 'sub' }],
                [{ 'header': 1 }, { 'header': 2 }, 'blockquote', 'code-block'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'align': [] }],
                [{ 'direction': 'rtl' }],
                [{ 'indent': '-1' }, { 'indent': '+1' }],
                ['link', 'image'],
                ['clean']
            ]
        },
        placeholder: 'Rédigez le contenu ici...'
    });

    var form = document.querySelector('.quill-form');
    form.addEventListener('submit', function(e) {
        document.getElementById('content-input-accordion').value = quill.root.innerHTML;
    });
</script>
@endpush