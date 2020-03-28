<?php

use App\Models\Server;
use Faker\Factory;
use Illuminate\Database\Seeder;

class ServersTableSeeder extends Seeder
{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
		for ($i = 0; $i <= 25; $i++) {
			Server::create(
				[
					'name'   => "Server {$i}",
					'status' => array_rand([true, false])
				]
			);
		}
	}
}
