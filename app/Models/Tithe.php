<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tithe extends Model
{
    use HasFactory;

    protected $fillable = [
        'amount',
        'tithe',
        'currency',
        'person',
        'date',
        'is_current',
        'transfer_id'
    ];


    public function getDateAttribute($value)
    {
        $date = new Carbon($value);
        return $date->format('d-m-Y');
    }

    public function transfer(){
        return $this->belongsTo(\App\Models\Transfer::class);
    }

}
