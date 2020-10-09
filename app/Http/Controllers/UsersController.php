<?php

namespace App\Http\Controllers;

use App\Models\User;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class UsersController extends Controller
{
    public function __construct(){
        $this->middleware('logs', ['except'=>['index', 'edit', 'create']]);
    }
    public function index()
    {
        $users = User::orderBy('id', 'DESC')->paginate(5)->onEachSide(1);

        return Inertia::render('Dashboard/Users/Index', ['users' => $users, 'url_create' => route('users.create')]);
    }

    public function create()
    {
        return Inertia::render('Dashboard/Users/Create', ['url' => route('users.store')]);
    }


    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'role' => 'required|in:root,user',
            'password' => 'required|min:8'
        ]);

        $data['password'] = Hash::make($data['password']);

        User::create($data);

        return Redirect::route('users.index');
    }

    public function edit(User $user)
    {

        return Inertia::render('Dashboard/Users/Edit', ['user' => $user, 'url' => route('users.update', $user)]);
    }


    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users,email,' . $user->id.',id',
            'role' => 'required|in:root,user',
            'password' => 'nullable|min:8'
        ]);

        if ($data['password']) {
            $data['password'] = Hash::make($data['password']);
        } else {
            unset($data['password']);
        }

        $user->update($data);

        return Redirect::route('users.index');

    }

    public function changeStatus(Request $request, User $user)
    {

        $user->update(['status'=>$request->status]);
        return $request->wantsJson()
            ? new JsonResponse('', 200)
            : back()->with('status', 'user-updated');
    }
}
