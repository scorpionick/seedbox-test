<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\BadResponseException;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;

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
	 * Show the admin home page
	 *
	 * @return \Illuminate\Contracts\Support\Renderable
	 * @throws \GuzzleHttp\GuzzleException
	 * @throws \Throwable
	 */
	public function index()
	{
		$servers     = $this->retrieveAllServers();
		$serversDown = $servers->where("status", "0")->count();

		return view('admin', compact("serversDown", "servers"));
	}

	/**
	 * Show the admin home page
	 *
	 * @param Request $request
	 * @return \Illuminate\Contracts\Support\Renderable
	 * @throws \GuzzleHttp\GuzzleException
	 * @throws \Throwable
	 */
	public function refresh(Request $request)
	{
		if ($request->ajax()) {
			return response()->json(
				[
					"table" => view("serversTable", ["servers" => $this->retrieveAllServers()])->render()
				]
			);
		}

		/** If Request is not ajax just redirect to home admin */
		return redirect()->route("admin");
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
	 * @throws \Throwable
	 */
	public function store(Request $request)
	{
		try {
			$client = new Client();
			$res    = $client->request("POST", "http://seedboxtest.develop/api/servers", ["json" => $request->all()]);

			if (Response::HTTP_CREATED === $res->getStatusCode()) {
				return response()->json(["success" => true]);
			}
		} catch (BadResponseException $exception) {
			return $this->formErrorResponse($exception);
		}

		return response()->json(["success" => false]);
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

			if (Response::HTTP_OK === $res->getStatusCode()) {
				return response()->json(["success" => true]);
			}
		} catch (BadResponseException $exception) {
			return $this->formErrorResponse($exception);
		}

		return response()->json(["success" => false]);
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

	/**
	 * Send request to API to retrieve all servers
	 *
	 * @return \Illuminate\Support\Collection
	 * @throws \GuzzleHttp\GuzzleException
	 */
	protected function retrieveAllServers()
	{
		$servers = collect([]);
		$client  = new Client();
		$res     = $client->request("GET", "http://seedboxtest.develop/api/servers");

		if (Response::HTTP_OK === $res->getStatusCode()) {
			$body    = $res->getBody();
			$content = json_decode($body->getContents());

			if ($content && property_exists($content, "data") && count($content->data) > 0) {
				$servers = collect($content->data);
			}
		}

		return $servers;
	}
}
