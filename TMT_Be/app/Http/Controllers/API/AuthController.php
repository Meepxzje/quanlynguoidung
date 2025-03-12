<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6'
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);

        $token = $user->createToken('UserToken')->accessToken;

        return response()->json([
            'token' => $token,
            'user' => $user,
            'message' => 'Registered successfully'
        ], 201);
    }
    public function login(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6'
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);
        }

        $user = Auth::user();
        $token = $user->createToken('LoginToken')->accessToken;

        if($user->isAdmin()) {
            return response()->json([
                'token' => $token,
                'user' => $user,
                'message' => 'Admin Login successfully'
            ], 200);
        }
        else {
            return response()->json([
                'token' => $token,
                'user' => $user,
                'message' => 'Login successfully'
            ], 200);
        }


    }

    public function user()
    {
        return response()->json([
            'user' => Auth::user()
        ], 200);
    }


    public function logout()
    {
        Auth::user()->token()->revoke();

        return response()->json([
            'message' => 'Logout successfully'
        ], 200);
    }
}
