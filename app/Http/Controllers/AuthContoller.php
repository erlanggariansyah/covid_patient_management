<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use ErlanggaRiansyah\ResponseHandler\Resp as ResponseHandler;

class AuthContoller extends Controller
{
    /**
     * POST /api/register
     */
    public function register(RegisterRequest $request) : Object {
        $request->validated()->hash()->save();

        // need to composer require erlanggariansyah/response-handler
        return ResponseHandler::requestCreated('user');
    }

    /**
     * POST /api/login
     */
    public function login(LoginRequest $request) : Object {
        if(!$request->validated()->attempt()) return ResponseHandler::loginAttemptUnsuccessful();

        return ResponseHandler::requestSuccessWithData($request->getToken(), 'token');
    }
}
