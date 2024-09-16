<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use TCG\Voyager\Models\Permission;

class AuthApiController extends Controller
{
    /**
     * // Este método maneja el registro de un nuevo usuario. Valida los datos de entrada,
     * crea un nuevo usuario en la base de datos y devuelve una respuesta JSON con el usuario creado.
     */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|confirmed',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['user' => $user], 201);
    }

    /**
     * Este método maneja el inicio de sesión de un usuario. Valida la entrada del correo electrónico y la contraseña,
     *  desencripta la contraseña utilizando una clave específica y verifica las credenciales del usuario.
     * Si son válidas, genera y devuelve un token de API; de lo contrario, devuelve un error de autorización.
     */

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $key = 'czB6yjT6rgEG5bkEDKGwRzqVmZx5ciTa';
        $decryptedPassword = $this->xorDecrypt($request->input('password'), $key);

        $user = User::where('email', $request->email)->first();

        if ($user && Hash::check($decryptedPassword, $user->password)) {
            $token = $user->createToken('API Token')->plainTextToken;
            return response()->json(['token' => $token]);
        }

        return response()->json(['error' => 'Unauthorized'], 401);
    }

    /**
     * Este método se encarga de cerrar la sesión del usuario eliminando todos los tokens asociados a él.
     * Devuelve una respuesta JSON confirmando que se ha cerrado la sesión exitosamente.
     */

    public function logout(Request $request)
    {
        // Ensure that the request has a token
        $request->user()->tokens()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }


    /**
     * Este método de la clase AuthApiController devuelve información del usuario autenticado,
     * incluyendo su ID, rol, nombre, correo electrónico y permisos asociados.
     * Si el usuario no tiene rol, se devuelve null para el nombre del rol y un array vacío para los permisos.
     */
    public function userInfo(Request $request)
    {
        //$user = Auth::user()->load('role.permissions');
        $user = Auth::user();
        $role = $user->role;
        $permissions = $role ? $role->permissions->pluck('key') : [];

        return response()->json([
            'user' => [
                'id' => $user->id,
                'role_id' => $user->role_id,
                'name' => $user->name,
                'email' => $user->email,
                //'avatar' => $user->avatar,
                //'email_verified_at' => $user->email_verified_at,
                //'settings' => $user->settings,
                //'created_at' => $user->created_at,
                //'updated_at' => $user->updated_at,
                'role' => $role ? $role->name : null, // Nombre del rol
                'permissions' => $permissions // Claves de los permisos
            ],
        ]);
    }


    public static function xorDecrypt(string $ciphertext, string $key): string
    {
        $result = '';
        $keyLength = strlen($key);

        for ($i = 0; $i < strlen($ciphertext); $i++) {
            // Desencripta usando XOR entre el carácter cifrado y el carácter de la clave
            $result .= chr(ord($ciphertext[$i]) ^ ord($key[$i % $keyLength]));
        }

        return $result;
    }
}
