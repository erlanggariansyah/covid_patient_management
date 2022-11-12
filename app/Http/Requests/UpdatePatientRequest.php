<?php

namespace App\Http\Requests;

use App\Models\Patient;
use Illuminate\Foundation\Http\FormRequest;

class UpdatePatientRequest extends FormRequest
{
    public function setId(int $id) : UpdatePatientRequest {
        $this->request->id = $id;

        return $this;
    }
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'id' => ['numeric', 'exists:patients,id'],
            'name' => ['string', 'max:50'],
            'phone' => ['numeric', 'digits:13', 'unique:patients,phone,' . $this->id],
            'address' => ['string', 'max:255'],
            'status' => ['in:recovered,positive,death'],
            'entry_at' => ['date_format:Y-m-d']
        ];
    }

    public function validated($key = null, $default = null)
    {
        parent::validated($key, $default); // TODO: Change the autogenerated stub

        return $this;
    }

    public function update() : Patient {
        $patient = Patient::find($this->id);
        if ($patient == null) throw new \Exception();
        $patient->update($this->all());

        return $patient->refresh();
    }
}
