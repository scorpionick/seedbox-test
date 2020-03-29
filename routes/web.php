<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get("/", function () {
	if (Auth::guest()) {
	    return redirect()->route("login");
	}

	return redirect()->route("admin");
});

Route::get("/login", function () {
    return view("auth.login");
});

Auth::routes(["register" => false, "password.request" => false, "reset" => false]);

Route::get("/admin", "Admin\AdminController@index")->name("admin");
