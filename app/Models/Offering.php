<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
class Offering extends Model
{
    use HasFactory;

    protected $fillable = [
        'amount',
        'currency',
        'person',
        'date',
        'is_current',
        'type_id',
        'transfer_id'
    ];
    public function getDateAttribute($value)
    {
        $date = new Carbon($value);
        return $date->format('d-m-Y');
    }

    public function type(){
        return $this->belongsTo(\App\Models\Type::class);
    }
    public function transfer(){
        return $this->belongsTo(\App\Models\Transfer::class);
    }
}
