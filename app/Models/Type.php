<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function thites(){
        return $this->hasMany('App\Offering');
    }

    public function offerings(){
        return $this->hasMany('App\Offering');
    }
}
