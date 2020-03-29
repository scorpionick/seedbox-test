<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Server;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ServerController extends Controller
{
	/** Retrieves all servers from the database */
	public function index()
	{
		return ["data" => Server::all()];
	}

	/**
	 * Retrieves a single server for the given id as route parameters
	 * Returns 404 is no match is found
	 *
	 * @param Server $server
	 * @return Server
	 */
	public function show(Server $server)
	{
		return $server;
	}

	/**
	 * Create a new server with matching parameters in $request
	 *
	 * @param Request $request
	 *
	 * @return Server
	 */
	public function store(Request $request)
	{
		$server = Server::create($request->all());

		return response()->json($server, Response::HTTP_CREATED);
	}

	/**
	 * Updates a given server matching id in route with matching parameters in $request.
	 * If no server is found return 404
	 *
	 * @param Request $request
	 * @param Server $server
	 * @return Server
	 */
	public function update(Request $request, Server $server)
	{
		$server->update($request->all());

		return response()->json($server, Response::HTTP_OK);
	}
}
