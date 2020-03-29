<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnToServerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection("server")->table('servers', function (Blueprint $table) {
            $table->ipAddress("domain")->after("name");
            $table->char("username", 255)->after("domain");
            $table->char("password", 255)->after("username");
        });
    }

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::connection("server")->table("servers", static function (Blueprint $table){
			$table->dropColumn("username");
			$table->dropColumn("password");
			$table->dropColumn("domain");
		});
	}
}
