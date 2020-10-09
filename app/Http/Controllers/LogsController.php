<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

use App\Models\Log as Bitacora;

class LogsController extends Controller{

    public function index(Request $request){
        $log = Bitacora::search($request->search)->with('user')->orderBy('id', 'DESC')->paginate(5)->onEachSide(1);
        return Inertia::render('Dashboard/Logs', ['logs'=>$log, 'search_text'=>$request->search]);
    }

    public static function saveLog($user_id, $action){

        $log = new Bitacora();
        $log->user_id = $user_id;
        $log->action = $action;
        $log->save();

        return true;
    }
}



