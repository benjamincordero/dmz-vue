<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Redirect;

use App\Models\Tithe;
use App\Models\Transfer;

use Illuminate\Http\Request;
use Inertia\Inertia;

class TithesController extends Controller
{
    public function __construct(){
        $this->middleware('logs', ['except'=>['index', 'edit', 'create']]);
    }
    public function index()
    {
        $tithes = Tithe::where('is_current', true)->get();
        return Inertia::render('Tithes/Index', ['tithes'=>$tithes]);
    }


    public function create()
    {
        return Inertia::render('Tithes/Create');
    }


    public function store(Request $request)
    {
        $data = $request->validate([
            'person' => 'required',
            'amount' => 'required|numeric',
            'currency' => 'required',
        ]);

        $tithe = new Tithe;

        $tithe->person = $request->person;
        $tithe->amount = $request->amount;
        $tithe->currency = $request->currency;
        $tithe->tithe = (float) $tithe->amount / 10;
        $tithe->date = date('Y-m-d');

        $tithe->save();
        return Redirect::route('diezmos.index');
    }


    public function edit($id)
    {
        $tithe = Tithe::find($id);
        return Inertia::render('Tithes/Edit', ['tithe'=>$tithe]);
    }


    public function update(Request $request, $id)
    {

        $data = $request->validate([
            'person' => 'required',
            'amount' => 'required|numeric',
            'currency' => 'required'
        ]);
        $tithe = Tithe::find($id);

        $tithe->person = $request->person;
        $tithe->amount = $request->amount;
        $tithe->currency = $request->currency;
        $tithe->tithe = (float) $tithe->amount / 10;

        $tithe->update();

        return Redirect::route('diezmos.index');
    }

    public function destroy($id)
    {
        $tithe = Tithe::find($id);
        $tithe->delete();
        return Redirect::route('diezmos.index');
    }

    public function complete(Request $request)
    {
        $data = $request->validate([
            'rate'=>'required'
        ]);
        $tithes = Tithe::where('is_current', 1)->get();
        if(count($tithes) > 0){
            $rate = $request->rate;
            $amount = 0;

            foreach ($tithes as $tithe) {
                if($tithe->currency === 'USD'){
                    $tithe->amount = $rate*$tithe->amount;
                    $tithe->tithe = (float) $tithe->amount / 10;
                    $tithe->currency = 'Bs';
                }
                $amount += $tithe->tithe;
                $tithe->is_current = 0;
                $tithe->update();
            }

            $in_dollars = $amount / $rate;
            $date = date('Y-m-d');
            $transfer = Transfer::create([
                'amount' => $amount,
                'in_dollars' => $in_dollars,
                'date' => $date,
                'rate' => $rate,
                'type_id' => 0
            ]);
            foreach ($tithes as $tithe) {
                $tithe->transfer_id = $transfer->id;
                $tithe->update();
            }
            return Redirect::route('transferencias.index');

        }

        return Redirect::route('diezmos.index');
    }

}
