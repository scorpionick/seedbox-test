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
		/** Prevents access by unauthenticated users */
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

		$servers     = collect([]);
		$serversDown = 0;

		if (Response::HTTP_OK === $res->getStatusCode()) {
			$body    = $res->getBody();
			$content = json_decode($body->getContents());

			if (property_exists($content, "data") && count($content->data) > 0) {
				$servers     = collect($content->data);
				$serversDown = $servers->where("status", "0")->count();
			}
		}

		return view('admin', compact("servers", "serversDown"));
	}

	/**
	 * Request the API for a server with a given server id
	 *
	 * @param Request $request
	 * @throws \GuzzleHttp\GuzzleException
	 */
	public function show(Request $request)
	{
		$serverId = $request->query->getInt("server_id");

		if ($serverId === 0) {
			return;
		}

		$client = new Client();
		$res    = $client->request(
			"GET", "http://seedboxtest.develop/api/servers/{$serverId}",
			["content-type" => "application/json"]
		);

		if (Response::HTTP_OK === $res->getStatusCode()) {

		}
	}

	/**
	 * Request the API to store a new server with given parameters.
	 *
	 * @param Request $request
	 * @throws \GuzzleHttp\GuzzleException
	 */
	public function store(Request $request)
	{
		$client = new Client();
		$res    = $client->request(
			"POST", "http://seedboxtest.develop/api/servers",
			["content-type" => "application/json"]
		);

		if (Response::HTTP_CREATED === $res->getStatusCode()) {

		}
	}

	/**
	 * Request the API to update a server matching the given server id with given parameters.
	 *
	 * @param Request $request
	 * @throws \GuzzleHttp\GuzzleException
	 */
	public function edit(Request $request)
	{
		$serverId = $request->query->getInt("server_id");

		if ($serverId === 0) {
			return;
		}

		$client = new Client();
		$res    = $client->request(
			"PUT", "http://seedboxtest.develop/api/servers/{$serverId}",
			["content-type" => "application/json"]
		);

		if (Response::HTTP_OK === $res->getStatusCode()) {

		}
	}
}
