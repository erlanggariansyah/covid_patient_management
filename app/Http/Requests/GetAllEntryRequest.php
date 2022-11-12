<?php

namespace App\Http\Requests;

use App\Models\EntryRecord;
use Illuminate\Foundation\Http\FormRequest;

class GetAllEntryRequest extends FormRequest
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
            'item_per_page' => ['nullable', 'integer']
        ];
    }

    public function validated($key = null, $default = null)
    {
        parent::validated($key, $default); // TODO: Change the autogenerated stub

        return $this;
    }

    public function getResource() : Object {
        return EntryRecord::getAll($this->get('item_per_page') ?? 5);
    }
}
