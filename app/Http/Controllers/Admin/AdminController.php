<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AdminController extends Controller
{
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		$this->middleware('auth');
	}

	/**
	 * Show the application dashboard.
	 *
	 * @return \Illuminate\Contracts\Support\Renderable
	 * @throws \GuzzleHttp\GuzzleException
	 */
	public function index()
	{
		$client = new Client();
		$res    = $client->request(
			"GET", "http://seedboxtest.develop/api/servers",
			["content-type" => "application/json"]
		);

		$servers = [];

		if (Response::HTTP_OK === $res->getStatusCode()) {
			$body    = $res->getBody();
			$content = json_decode($body->getContents());

			if (property_exists($content, "data") && count($content->data) > 0) {
				$servers = $content->data;
			}
		}


		return view('admin', ["servers" => $servers]);
	}
}
