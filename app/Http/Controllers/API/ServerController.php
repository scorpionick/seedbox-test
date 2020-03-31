<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Server;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

/**
 * The current API class is currently not secured what so ever. Lack of knowledge in API creation and consumption to secure this
 * properly with oAuth2 and token mechanics.
 *
 * Class ServerController
 * @package App\Http\Controllers\API
 */
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
	 * @return array
	 */
	public function show(Server $server)
	{
		return ["data" => $server];
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
		$validator = $this->validateRequestParameters($request);

		if ($validator->fails()) {
			return response()->json(
				[
					"server"  => (new Server())->fill($request->all()), //returns a server filled with user entered data
					"errors"  => $validator->errors(),
					"message" => "New server couldn't be created!"
				],
				Response::HTTP_BAD_REQUEST
			);
		}

		/** Create new server into the database */
		$server = Server::create($request->all());

		return response()->json(
			[
				"data"    => $server,
				"message" => "New server stored successfully."
			],
			Response::HTTP_CREATED
		);
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
		$validator = $this->validateRequestParameters($request);

		if ($validator->fails()) {
			return response()->json(
				[
					"server"  => $server->fill($request->all()), //returns a server filled with user entered data
					"errors"  => $validator->errors(),
					"message" => "Server with id {$server->id} coulnd't be updated!"
				],
				Response::HTTP_BAD_REQUEST
			);
		}

		/** Save server with data in request */
		$server->update($request->all());

		return response()->json(
			[
				"data"    => $server,
				"message" => "Server with id {$server->id} was updated successfully."
			],
			Response::HTTP_OK
		);
	}

	/**
	 * Validate if parameters meets the Model's requirements before saving
	 *
	 * @param Request $request
	 * @return \Illuminate\Contracts\Validation\Validator
	 */
	private function validateRequestParameters(Request $request)
	{
		return Validator::make($request->all(), [
			"name"     => "required",
			"domain"   => "required",
			"username" => "required",
			"password" => "required"
		]);
	}
}
