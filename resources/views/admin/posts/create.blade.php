@extends('layouts.app')

@section('title', 'Articles du blog')

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
            {{ isset($post) ? 'Modifier l\'article' : 'Ajouter un article' }}
        </h4>
        <form action="{{ isset($post) ? route('admin.posts.update', $post) : route('admin.posts.store') }}" method="POST" enctype="multipart/form-data" class="quill-form">
            @csrf
            @if(isset($post)) @method('PUT') @endif

            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Titre</label>
                <input type="text" name="title" class="form-input" value="{{ old('title', $post->title ?? '') }}" required>
                @error('title')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>
            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Contenu</label>
                <!-- Zone Quill -->
                <div id="text-editor" style="height: 300px;">{!! old('content', $post->content ?? '') !!}</div>
                <!-- Champ caché pour envoyer le contenu HTML à Laravel -->
                <input type="hidden" name="content" id="content-input">
                @error('content')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>
            <div class="mb-3">
                <label class="text-default-800 text-sm font-medium inline-block mb-2">Image</label>
                <input type="file" name="image" class="form-input">
                @if(isset($post) && $post->image)
                    <img src="{{ asset($post->image) }}" alt="image" style="max-width: 100px; max-height: 100px; margin-top: 10px; object-fit: cover;">
                @endif
                @error('image')<div class="text-xs text-red-600 mt-1">{{ $message }}</div>@enderror
            </div>
            <button type="submit" class="btn bg-primary text-white">
                {{ isset($post) ? 'Mettre à jour' : 'Ajouter' }}
            </button>
        </form>
    </div>
</div>
@endsection

@push('js')
<script src="{{ asset('assets/libs/quill/quill.min.js') }}"></script>
<script src="{{ asset('assets/js/pages/form-editor.js') }}"></script>
<script>
    var quill = new Quill('#text-editor', {
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
        document.getElementById('content-input').value = quill.root.innerHTML;
    });
</script>
@endpush