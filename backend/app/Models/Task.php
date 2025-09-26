<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    /**
     * Campos que se pueden asignar de manera masiva
     */
    protected $fillable = [
        'title',
        'description',
        'due_date',
        'done',
        'user_id',
    ];

    /**
     * Tipos de conversión automática de atributos
     */
    protected $casts = [
        'done' => 'boolean',
        'due_date' => 'datetime',
    ];

    /**
     * Relación: Una tarea pertenece a un usuario
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
