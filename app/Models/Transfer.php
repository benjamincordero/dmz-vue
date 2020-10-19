<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class Transfer extends Model
{
    use HasFactory;

    protected $fillable = [
        'amount',
        'rate',
        'date',
        'in_dollars',
        'type_id',
    ];
    public function getDateAttribute($value)
    {
        $date = new Carbon($value);
        return $date->format('d-m-Y');
    }

    public function tithes()
    {
        return $this->hasMany(\App\Models\Tithe::class);
    }
    public function offerings()
    {
        return $this->hasMany(\App\Models\Offering::class);
    }

    public function type(){
        return $this->belongsTo(\App\Models\Type::class);
    }


}
