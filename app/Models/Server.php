<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Server extends Model
{
	/** @var string //Defines which connection the Eloquent Model is using */
    protected $connection = "server";

    /** @var array */
    protected $fillable = ["name", "status", "domain", "username"];
}
