<?php

namespace App\Http\Requests;

use App\Models\OutRecord;
use Illuminate\Foundation\Http\FormRequest;

class AddOutRequest extends FormRequest
{
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
            'entry_id' => ['required', 'integer', 'exists:entry_records,id', 'unique:out_records,entry_id'],
            'out_at' => ['required', 'date_format:Y-m-d']
        ];
    }

    public function validated($key = null, $default = null)
    {
        parent::validated($key, $default); // TODO: Change the autogenerated stub

        return $this;
    }

    public function save() : OutRecord {
        return OutRecord::create([
            'entry_id' => $this->request->get('entry_id'),
            'out_at' => $this->request->get('out_at')
        ]);
    }
}
