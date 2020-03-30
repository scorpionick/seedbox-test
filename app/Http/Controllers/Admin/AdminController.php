<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\BadResponseException;
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
	 * @return \Illuminate\Http\JsonResponse|void
	 * @throws \GuzzleHttp\GuzzleException
	 * @throws \Throwable
	 */
	public function show(Request $request)
	{
		$form = view("serverForm");

		try {
			$serverId = $request->query->getInt("server_id");
			$client   = new Client();
			$res      = $client->request("GET", "http://seedboxtest.develop/api/servers/{$serverId}");

			$body    = $res->getBody();
			$content = json_decode($body->getContents());

			if (property_exists($content, "data")) {
				$form = $form->with(["server" => $content->data]);
			}

			return response()->json(["success" => true, "form" => $form->render()]);
		} catch (\Exception $exception) {
			if ($exception->getCode() === Response::HTTP_NOT_FOUND) {
				return response()->json(["success" => true, "form" => $form->render()]);
			}

			throw $exception;
		}
	}

	/**
	 * Request the API to store a new server with given parameters.
	 *
	 * @param Request $request
	 * @return \Illuminate\Http\JsonResponse
	 * @throws \GuzzleHttp\GuzzleException
	 */
	public function store(Request $request)
	{
		$client = new Client();
		$res    = $client->request("POST", "http://seedboxtest.develop/api/servers", ["json" => $request->all()]);

		if (Response::HTTP_CREATED === $res->getStatusCode()) {
			return response()->json(["success" => true]);
		}
	}

	/**
	 * Request the API to update a server matching the given server id with given parameters.
	 *
	 * @param Request $request
	 * @return \Exception|BadResponseException|void
	 * @throws \GuzzleHttp\GuzzleException
	 * @throws \Throwable
	 */
	public function update(Request $request)
	{
		$serverId = $request->request->getInt("server_id");

		if ($serverId === 0) {
			return;
		}

		try {
			$client = new Client();
			$res    = $client->request(
				"PUT", "http://seedboxtest.develop/api/servers/{$serverId}",
				["json" => $request->all()]
			);
		} catch (BadResponseException $exception) {
			return $this->formErrorResponse($exception);
		}


		if (Response::HTTP_OK === $res->getStatusCode()) {
			return response()->json(["success" => true]);
		}
	}

	/**
	 * Generate form view when BadResponseException is thrown by Guzzle and Status code is 400
	 *
	 * @param BadResponseException $exception
	 * @return \Illuminate\Http\JsonResponse
	 * @throws \Throwable
	 */
	protected function formErrorResponse(BadResponseException $exception)
	{
		if ($exception->getCode() === Response::HTTP_BAD_REQUEST) {
			$contents = json_decode($exception->getResponse()->getBody()->getContents());
			$form     = view("serverForm", ["server" => $contents->server])->withErrors($contents->errors);

			return response()->json(["success" => false, "form" => $form->render()]);
		}

		throw $exception;
	}
}
