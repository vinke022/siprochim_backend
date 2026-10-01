<div class="card">
    <div class="p-6">
        <h4 class="card-title mb-4">Informations du profil</h4>
        <form method="post" action="{{ route('profile.update') }}" class="space-y-6">
            @csrf
            @method('patch')

            <div class="mb-3">
                <label for="name" class="text-default-800 text-sm font-medium inline-block mb-2">Nom</label>
                <input type="text" name="name" id="name" class="form-input" value="{{ old('name', $user->name) }}" required autofocus autocomplete="name" />
                @error('name')
                    <div class="text-xs text-red-600 mt-1">{{ $message }}</div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="email" class="text-default-800 text-sm font-medium inline-block mb-2">Email</label>
                <input type="email" name="email" id="email" class="form-input" value="{{ old('email', $user->email) }}" required autocomplete="username" />
                @error('email')
                    <div class="text-xs text-red-600 mt-1">{{ $message }}</div>
                @enderror

                @if ($user instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && ! $user->hasVerifiedEmail())
                    <div>
                        <p class="text-sm mt-2 text-gray-800">
                            Votre adresse email n'est pas vérifiée.
                            <button form="send-verification" class="underline text-sm text-gray-600 hover:text-gray-900">
                                Cliquez ici pour renvoyer l'email de vérification.
                            </button>
                        </p>
                        @if (session('status') === 'verification-link-sent')
                            <p class="mt-2 font-medium text-sm text-green-600">
                                Un nouveau lien de vérification a été envoyé à votre adresse email.
                            </p>
                        @endif
                    </div>
                @endif
            </div>
            <div class="flex items-center gap-4">
                <button class="btn bg-primary text-white">Enregistrer</button>
                @if (session('status') === 'profile-updated')
                    <p class="text-sm text-green-600">Modifications enregistrées.</p>
                @endif
            </div>
        </form>
    </div>
</div>
