<?php

namespace App\Http\Controllers;

use App\Models\Transfer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class TransfersController extends Controller
{
    public function __construct(){
        $this->middleware('logs', ['except'=>['index', 'show']]);
    }
    public function index()
    {
        $tranfers = Transfer::with('type')->orderBy('id', 'DESC')->paginate(5)->onEachSide(1);
        return Inertia::render('Transfers/Index', ['transfers'=>$tranfers]);
    }

    public function show($id)
    {
        $transfer = Transfer::find($id);

        if ($transfer->type_id) {
            $details = $transfer->offerings()->with(['type', 'transfer'])->get();
        } else {
            $details = $transfer->tithes()->with('transfer')->get();
        }

        return Inertia::render('Transfers/Show', ['details'=>$details]);
    }

    public function destroy($id)
    {
        $transfer = Transfer::find($id);
        $transfer->delete();

        return Redirect::route('transferencias.index');
    }
}
