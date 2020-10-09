<?php

namespace App\Models;

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
        return $query->where('action', 'like', "%$search%");
    }

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }
}
