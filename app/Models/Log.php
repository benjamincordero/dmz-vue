<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'action',
    ];
    public function scopeSearch($query, $search)
    {
        return $query->where('action', 'like', "%$search%")->orWhereHas('user', function(Builder $query) use ($search){

            $query->where('name', 'like', "%$search%");
        });
    }

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }


    # cast type

    protected $casts = [
        'created_at' => 'datetime:d-m-Y H:i:s',
    ];

}
