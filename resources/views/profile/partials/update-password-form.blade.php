<div class="card">
    <div class="p-6">
        <h4 class="card-title mb-4">Mettre à jour le mot de passe</h4>
        <form method="post" action="{{ route('password.update') }}" class="space-y-6">
            @csrf
            @method('put')

            <div class="mb-3">
                <label for="current_password" class="text-default-800 text-sm font-medium inline-block mb-2">Mot de passe actuel</label>
                <input type="password" name="current_password" id="current_password" class="form-input" autocomplete="current-password">
                @if($errors->updatePassword->get('current_password'))
                    <div class="text-xs text-red-600 mt-1">{{ $errors->updatePassword->first('current_password') }}</div>
                @endif
            </div>
            <div class="mb-3">
                <label for="password" class="text-default-800 text-sm font-medium inline-block mb-2">Nouveau mot de passe</label>
                <input type="password" name="password" id="password" class="form-input" autocomplete="new-password">
                @if($errors->updatePassword->get('password'))
                    <div class="text-xs text-red-600 mt-1">{{ $errors->updatePassword->first('password') }}</div>
                @endif
            </div>
            <div class="mb-3">
                <label for="password_confirmation" class="text-default-800 text-sm font-medium inline-block mb-2">Confirmer le mot de passe</label>
                <input type="password" name="password_confirmation" id="password_confirmation" class="form-input" autocomplete="new-password">
                @if($errors->updatePassword->get('password_confirmation'))
                    <div class="text-xs text-red-600 mt-1">{{ $errors->updatePassword->first('password_confirmation') }}</div>
                @endif
            </div>
            <div class="flex items-center gap-4">
                <button class="btn bg-primary text-white">Enregistrer</button>
                @if (session('status') === 'password-updated')
                    <p class="text-sm text-green-600">Mot de passe modifié.</p>
                @endif
            </div>
        </form>
    </div>
</div>
