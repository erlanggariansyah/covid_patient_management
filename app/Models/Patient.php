<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\DB;

class Patient extends Model
{
    use HasFactory;
    protected $table = 'patients';
    protected $fillable = [
        'name', 'phone', 'address', 'status'
    ];

    public function entry() : HasMany {
        return $this->hasMany(EntryRecord::class);
    }

    public static function getAll(int $itemPerPage) : Object {
        return DB::table('patients')->paginate($itemPerPage ?? 5);
    }

    public static function getAllByStatus(int $itemPerPage, String $status) : Object {
        return DB::table('patients')
            ->where('status', $status)
            ->paginate($itemPerPage ?? 5);
    }

    public static function getAllByNameContaining(int $itemPerPage, String $name) : Object {
        return DB::table('patients')
            ->where('name', 'LIKE', '%' . $name . '%')
            ->paginate($itemPerPage ?? 5);
    }
}
