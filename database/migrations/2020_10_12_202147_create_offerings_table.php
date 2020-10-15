<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOfferingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('offerings', function (Blueprint $table) {
            $table->id();

            $table->double('amount')->comment('Monto');
            $table->string('currency')->comment('Moneda');
            $table->string('person')->comment('Nombre de la persona');
            $table->date('date');
            $table->boolean('is_current')->default(true);
            $table->unsignedBigInteger('type_id')->comment('Tipo de Ofrenda');
            $table->unsignedBigInteger('transfer_id')->nullable();

            $table->foreign('type_id')->references('id')->on('types');

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
        Schema::dropIfExists('offerings');
    }
}
