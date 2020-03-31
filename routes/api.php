<?php

use App\Models\Server;
use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
	return $request->user();
});

/**
 * If Passport would be implemented properly, with right token management I would add middleware('auth:api')
 * to protect this group with the inner Laravel API mechanic.
 *
 * As of now all /api/ routes are not protected successfully and remain open to be able to provide a functional
 * demo for the test.
 */
Route::namespace('API')->group(function (){
	Route::get('/servers', 'ServerController@index');
	Route::get('/servers/{server}', 'ServerController@show');
	Route::post('/servers', 'ServerController@store');
	Route::put('/servers/{server}', 'ServerController@update');
});
