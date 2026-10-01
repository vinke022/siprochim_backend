@if(session('success'))
    <div class="bg-success text-sm text-white rounded-md p-4" role="alert">
        {{ session('success') }}
    </div>
@endif

@if(session('error'))
    <div class="bg-danger text-sm text-white rounded-md p-4" role="alert">
        {{ session('error') }}
    </div>
@endif

@if($errors->any())
    <div class="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-red-800">
        <ul class="list-disc pl-5 mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
