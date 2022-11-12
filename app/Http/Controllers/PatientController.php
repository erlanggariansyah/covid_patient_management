<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddPatientRequest;
use App\Http\Requests\GetAllPatientRequest;
use App\Http\Requests\GetPatientStatusRequest;
use App\Http\Requests\SearchPatientRequest;
use App\Http\Requests\UpdatePatientRequest;
use App\Models\Patient;
use ErlanggaRiansyah\ResponseHandler\Resp as ResponseHandler;

/**
 * PatientController class, manage /api/patients API prefix.
 *
 * @extends Controller
 */
class PatientController extends Controller
{
    /**
     * Display a listing of the patients.
     * PATH: /api/patients
     * METHOD: GET
     *
     * @param GetAllPatientRequest $request
     * @return Object
     */
    public function index(GetAllPatientRequest $request) : Object
    {
        return ResponseHandler::requestSuccessWithData($request->validated()->getResource());
    }

    /**
     * Store a newly created patient in the database.
     * PATH: /api/patients
     * METHOD: POST
     *
     * @param  AddPatientRequest  $request
     * @return Object
     */
    public function store(AddPatientRequest $request) : Object
    {
        return ResponseHandler::requestSuccessWithData($request->validated()->save());
    }

    /**
     * Display the specified patient.
     * PATH: /api/patients/{id}
     * METHOD: GET
     *
     * @param  int  $id
     * @return Object
     */
    public function show($id) : Object
    {
        $patient = Patient::with('entry')->find($id);
        if (!$patient) return ResponseHandler::requestNotFound('id');

        return ResponseHandler::requestSuccessWithData($patient);
    }

    /**
     * Display a listing of the patients by status
     * PATH: /api/patients/status/{status}
     * METHOD: GET
     *
     * @param GetPatientStatusRequest $request
     * @param $status
     * @return Object
     */
    public function indexByStatus(GetPatientStatusRequest $request, $status) : Object {
        return ResponseHandler::requestSuccessWithData($request->setStatus($status)->validated()->getResource());
    }

    /**
     * Update the specified patient in the database.
     * PATH: /api/patients/{id}
     * METHOD: PUT
     *
     * @param  UpdatePatientRequest $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePatientRequest $request, $id) : Object
    {
        try { $request->setId($id)->validated()->update(); } catch (\Exception $e) {
            return ResponseHandler::requestInvalid('id');
        }

        return ResponseHandler::requestSuccess();
    }

    /**
     * Remove the specified patient from database.
     * PATH: /api/patients/{id}
     * METHOD: DELETE
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) : Object
    {
        $patient = Patient::find($id);
        if (!$patient) return ResponseHandler::requestNotFound('id');
        $patient->delete();

        return ResponseHandler::requestSuccess();
    }

    /**
     * Display a listing of the patients by name
     * PATH: /api/patients/search/{name}
     * METHOD: GET
     *
     * @param SearchPatientRequest $request
     * @return Object
     */
    public function search(SearchPatientRequest $request) : Object {
        return ResponseHandler::requestSuccessWithData($request->validated()->getResource());
    }
}
