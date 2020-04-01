<?php

namespace Tests\Unit;

use App\Models\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AdminControllerTest extends TestCase
{
	/** @var User */
	private $user;

	protected function setUp(): void
	{
		parent::setUp();

		$this->user = factory(User::class)->create();
	}

	public function testIndex()
	{
		$this->call("GET", "admin")->assertRedirect("login");

		$this->actingAs($this->user)
		     ->call("GET", "admin")
		     ->assertViewHas("servers");
	}

	public function testRefresh()
	{
		$this->actingAs($this->user)
		     ->call("GET", "admin/servers/refresh")
		     ->assertRedirect("admin");

		$this->actingAs($this->user)
		     ->get("admin/servers/refresh", ["X-Requested-With" => "XMLHttpRequest"])
		     ->assertJsonStructure(["table"]);
	}
}
