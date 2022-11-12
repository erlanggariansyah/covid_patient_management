<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddEntryRequest;
use App\Http\Requests\AddOutRequest;
use App\Http\Requests\GetAllEntryRequest;
use App\Http\Requests\GetEntryPatientRequest;
use App\Models\EntryRecord;
use ErlanggaRiansyah\ResponseHandler\Resp as ResponseHandler;
use Illuminate\Http\Request;

/**
 * EntryController class, manage /api/entries prefix.
 *
 * @extends Controller
 */
class EntryController extends Controller
{
    /**
     * Display a listing of the entry.
     * PATH: /api/entries
     * METHOD: GET
     *
     * @param GetAllEntryRequest
     * @return Object
     */
    public function index(GetAllEntryRequest $request) : Object
    {
        return ResponseHandler::requestSuccessWithData($request->validated()->getResource());
    }

    /**
     * Store a newly created entries in the database.
     * PATH: /api/entries
     * METHOD: POST
     *
     * @param  AddEntryRequest  $request
     * @return Object
     */
    public function store(AddEntryRequest $request) : Object
    {
        return ResponseHandler::requestSuccessWithData($request->validated()->save());
    }

    /**
     * Store a newly created out in the database.
     * PATH: /api/entries/out
     * METHOD: POST
     *
     * @param AddOutRequest $request
     * @return Object
     */
    public function storeOut(AddOutRequest $request) : Object {
        return ResponseHandler::requestSuccessWithData($request->validated()->save());
    }

    /**
     * Display the specified entry.
     * PATH: /api/entries/{id}
     * METHOD: GET
     *
     * @param  int  $id
     * @return Object
     */
    public function show($id)
    {
        $entry = EntryRecord::with('out')->find($id);
        if (!$entry) return ResponseHandler::requestNotFound('id');

        return ResponseHandler::requestSuccessWithData($entry);
    }

    /**
     * Remove the specified entry from the database.
     * PATH: /api/entries/{id}
     * METHOD: DELETE
     *
     * @param  int  $id
     * @return Object
     */
    public function destroy($id) : Object
    {
        $entry = EntryRecord::find($id);
        if (!$entry) return ResponseHandler::requestNotFound('id');
        $entry->delete();

        return ResponseHandler::requestSuccess();
    }

    /**
     * Display a listing of the entry by patient id
     * PATH: /api/entries/patient/{id}
     * METHOD: GET
     *
     * @param GetEntryPatientRequest $request
     * @return Object
     */
    public function showByPatientID(GetEntryPatientRequest $request, $id) : Object {
        try { return ResponseHandler::requestSuccessWithData($request->setPatientId($id)->validated()->getResource()); }
        catch (\Exception $e) { return ResponseHandler::requestInvalid('patient_id'); }
    }
}
