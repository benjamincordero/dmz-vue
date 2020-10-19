<?php

namespace App\Http\Controllers;

use App\Models\Offering;
use App\Models\Transfer;
use App\Models\Type;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Redirect;

class OfferingsController extends Controller
{
    public function __construct(){
        $this->middleware('logs', ['except'=>['index', 'edit', 'create']]);
    }
    public function index()
    {
        $offerings = Offering::with('type')->where('is_current', true)->get();
        return Inertia::render('Offerings/Index', ['offerings'=>$offerings]);
    }

    public function create()
    {
        return Inertia::render('Offerings/Create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'person' => 'required',
            'amount' => 'required|numeric',
            'currency' => 'required',
            'type_id' => 'required'
        ]);
        $data['date'] = date('Y-m-d');;

        Offering::create($data);

        return Redirect::route('ofrendas.index');

    }

    public function edit($id)
    {
        $offering = Offering::find($id);
        return Inertia::render('Offerings/Edit', ['offering'=>$offering]);
    }

    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'person' => 'required',
            'amount' => 'required|numeric',
            'type_id' => 'required',
            'currency'=>'required'
        ]);

        $offering = Offering::find($id);

        $offering->person = $request->person;
        $offering->amount = $request->amount;
        $offering->currency = $request->currency;
        $offering->type_id = $request->type_id;

        $offering->update();
        return Redirect::route('ofrendas.index');
    }

    public function destroy($id)
    {
        $offering = Offering::find($id);
        $offering->delete();
        return Redirect::route('ofrendas.index');
    }

    public function complete(Request $request)
    {
        $data = $request->validate([
            'rate'=>'required',
            'type_id'=>'required'
        ]);

        $rate = $request->rate;
        $type = Type::find($request->type_id);

        $amount = 0;
        $offerings = Offering::where('is_current', 1)->where('type_id', $type->id)->get();

        foreach ($offerings as $offering) {
            if($offering->currency === 'USD'){
                $offering->amount = $rate*$offering->amount;
                $offering->currency = 'Bs';
            }
            $offering->is_current = 0;
            $amount += $offering->amount;
            $offering->update();
        }

        if ($offerings->count()) {
            $rate = $request->rate;
            $in_dollars = $amount / $rate;
            $date = date('Y-m-d');
            $transfer = new Transfer(['amount' => $amount, 'in_dollars' => $in_dollars, 'date' => $date, 'rate' => $rate, 'type_id' => $type->id]);
            $transfer->save();
            foreach ($offerings as $offering) {
                $offering->transfer_id = $transfer->id;
                $offering->update();
            }

            return Redirect::route('transferencias.index');
        }
        return Redirect::route('ofrendas.index');
    }

}
