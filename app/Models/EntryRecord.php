<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Facades\DB;

class EntryRecord extends Model
{
    use HasFactory;
    protected $table = 'entry_records';
    protected $fillable = [
        'patient_id', 'entry_at'
    ];

    public function patient() : BelongsTo {
        return $this->belongsTo(Patient::class);
    }

    public function out() : HasOne {
        return $this->hasOne(OutRecord::class, 'entry_id');
    }

    public static function getAll(int $itemPerPage) : Object {
        return DB::table('entry_records')->paginate($itemPerPage);
    }

    public static function getAllByPatientID(int $itemPerPage, int $patientID) : Object {
        return DB::table('entry_records')->where('patient_id', $patientID)->paginate($itemPerPage);
    }
}
