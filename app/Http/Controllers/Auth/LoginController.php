<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class LoginController extends Controller
{
	/*
	|--------------------------------------------------------------------------
	| Login Controller
	|--------------------------------------------------------------------------
	|
	| This controller handles authenticating users for the application and
	| redirecting them to your home screen. The controller uses a trait
	| to conveniently provide its functionality to your applications.
	|
	*/

	use AuthenticatesUsers;

	/**
	 * Where to redirect users after login.
	 *
	 * @var string
	 */
	protected $redirectTo = '/home';

	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		$this->middleware('guest')->except('logout');
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\Response|\Symfony\Component\HttpFoundation\Response
	 * @throws \Illuminate\Validation\ValidationException
	 */
	public function login(Request $request)
	{
		$this->validateLogin($request);

		if ($this->attemptLogin($request)) {
			/** @var User|null $user */
			$user  = $request->user();
			$token = null;

			if ($user) {
				$token = $user->createToken("Access Token")->accessToken;
			}

			return response()->json(["success" => ["token" => $token]], Response::HTTP_OK);
		}

		return $this->sendFailedLoginResponse($request);
	}
}
