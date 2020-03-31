<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Server extends Model
{
	/** @var string //Defines which connection the Eloquent Model is using */
	protected $connection = "server";

	protected $attributes = [
		"id"       => null,
		"name"     => "",
		"status"   => true,
		"domain"   => "",
		"username" => "",
		"password" => ""
	];

	/** @var array */
	protected $fillable = ["name", "status", "domain", "username", "password"];

	/** @var array */
	protected $hidden = ["password"];

	/**
	 * Encrypt password value before persisting to database
	 * @param $password
	 */
	public function setPasswordAttribute($password)
	{
		$this->attributes["password"] = bcrypt($password);
	}
}
