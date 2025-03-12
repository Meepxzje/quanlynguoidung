<?php

use App\Http\Controllers\API\AdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\UserController;

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);


    Route::get('user', [AuthController::class, 'user']);

    Route::get('/user/profile', [UserController::class, 'show']);
    Route::put('/user/profile', [UserController::class, 'update']);
    Route::post('/user/profile/updatepassword', [UserController::class, 'updatePassword']);

    Route::middleware(['auth:api', 'role:admin'])->prefix('admin')->group(function () {
        Route::get('/users', [AdminController::class, 'indexUser']);
        Route::get('/users/{id}', [AdminController::class, 'showUser']);
        Route::put('/users/{id}', [AdminController::class, 'updateUser']);
        Route::delete('/users/{id}', [AdminController::class, 'destroyUser']);
    });
});


