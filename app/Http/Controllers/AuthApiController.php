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

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            $token = $user->createToken('API Token')->plainTextToken;
            return response()->json(['token' => $token]);
        }

        return response()->json(['error' => 'Unauthorized'], 401);
    }

    public function logout(Request $request)
    {
        // Ensure that the request has a token
        $request->user()->tokens()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }


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

}
