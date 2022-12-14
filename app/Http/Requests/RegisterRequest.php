<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class RegisterRequest extends FormRequest
{
    private $hashedPassword;
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
            'name' => ['required', 'string'],
            'email' => ['required', 'email', 'unique:users,email'],
            'password' => ['required', 'string', 'min:8']
        ];
    }

    public function validated($key = null, $default = null)
    {
        parent::validated($key, $default); // TODO: Change the autogenerated stub

        return $this;
    }

    public function hash() : RegisterRequest {
        $this->hashedPassword = Hash::make($this->get('password'));

        return $this;
    }

    public function save() : User {
        return User::create([
            'name' => $this->get('name'),
            'email' => $this->get('email'),
            'password' => $this->hashedPassword
        ]);
    }
}
