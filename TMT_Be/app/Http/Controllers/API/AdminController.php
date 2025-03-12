<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function indexUser()
    {
        $user = User::all();
        return response()->json(['success' => true, 'users' => $user]);
    }
    /**
     * Display the specified resource.
     */
    public function showUser(string $id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found']);
        }
        return response()->json(['success' => true, 'user' => $user]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateUser(Request $request, string $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found']);
        }
        $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|email|unique:users,email,' . $id,
            'role' => 'sometimes|required|in:user,admin,editor',
        ]);
        $user->update($request->only(['name', 'email', 'role']));
        return response()->json(['success' => true, 'message' => 'User updated successfully', 'user' => $user]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroyUser(string $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found']);
        }
        $user->delete();
        return response()->json(['success' => true, 'message' => 'User deleted successfully']);
    }
}
