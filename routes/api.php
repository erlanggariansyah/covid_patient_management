<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthContoller;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\EntryController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('register', [AuthContoller::class, 'register']);
Route::post('login', [AuthContoller::class, 'login'])->name('login');

Route::middleware('auth:sanctum')->group(function () {
    Route::prefix('patients')->group(function () {
        Route::get('', [PatientController::class, 'index']);
        Route::post('', [PatientController::class, 'store']);
        Route::get('search/', [PatientController::class, 'search']);
        Route::get('status/{status}', [PatientController::class, 'indexByStatus']);
        Route::get('/{id}', [PatientController::class, 'show']);
        Route::put('/{id}', [PatientController::class, 'update']);
        Route::delete('/{id}', [PatientController::class, 'destroy']);
    });

    Route::prefix('entries')->group(function () {
        Route::get('', [EntryController::class, 'index']);
        Route::post('', [EntryController::class, 'store']);
        Route::post('out', [EntryController::class, 'storeOut']);
        Route::get('/patient/{id}', [EntryController::class, 'showByPatientID']);
        Route::delete('{id}', [EntryController::class, 'destroy']);
        Route::get('{id}', [EntryController::class, 'show']);
    });
});
