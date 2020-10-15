<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTithesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tithes', function (Blueprint $table) {
            $table->id();
            $table->double('amount')->comment('Monto Total');
            $table->double('tithe')->comment('Diezmado');
            $table->string('currency')->comment('Moneda');
            $table->string('person')->comment('Nombre de la Persona');
            $table->date('date');
            $table->boolean('is_current')->default(true);
            $table->unsignedBigInteger('transfer_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tithes');
    }
}
