<?php

namespace App\Http\Controllers;

use App\Http\Requests\PromotionRequest;
use App\Models\Promotion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class PromotionController extends Controller
{
    //
    public function index(Request $request)
    {
        $promotions = Promotion::paginate(10);
        return view('promotions.list', compact('promotions'));
    }

    public function store(PromotionRequest $request)
    {
        $title = "Add Promotion";
        if ($request->isMethod('POST')) {
            $params = $request->except('_token');
            $promotion = Promotion::create($params);
            if ($promotion->id) {
                Session::flash('success', 'Add Promotion Successfully');
            }
        }
        return view('promotions.store', compact('title'));
    }
    public function update(PromotionRequest $request, $id)
    {
        $title = "Edit Promotion";
        $promotion = DB::table('promotions')->where('id', $id)->first();
        if ($request->isMethod('POST')) {
            $params = $request->except('_token');
            $result = Promotion::where('id', $id)->update($params);
            if ($result) {
                Session::flash('success', 'Update Promotion Successfully');
                return redirect()->route('edit_promotion', ['id' => $id]);
            }
        }
        return view('promotions.update', compact(['title', 'promotion']));
    }

    public function destroy($id)
    {
        $promotionDL = DB::table('promotions')->where('id', $id)->delete();
        if ($promotionDL) {
            Session::flash('success', 'Delete Promotion Successfully');
            return redirect()->route('promotions');
        }
    }
}
