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

Route::namespace('API')->group(function (){
	Route::get('/servers', 'ServerController@index');
	Route::get('/servers/{server}', 'ServerController@show');
	Route::post('/servers/{server}', 'ServerController@store');
	Route::put('/servers/{server}', 'ServerController@update');
});
