<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OutRecord extends Model
{
    use HasFactory;
    protected $table = 'out_records';
    protected $fillable = [
        'entry_id', 'out_at'
    ];

    public function entry() : BelongsTo {
        return $this->belongsTo(EntryRecord::class, 'entry_id');
    }
}
