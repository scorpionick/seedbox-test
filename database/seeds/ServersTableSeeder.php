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
		Server::truncate();

		$factory = Factory::create();

		for ($i = 0; $i <= 25; $i++) {
			Server::create(
				[
					"name"     => "Server {$i}",
					"status"   => array_rand([true, false]),
					"domain"   => $factory->localIpv4,
					"username" => $factory->userName,
					"password" => bcrypt($factory->password),
				]
			);
		}
	}
}
