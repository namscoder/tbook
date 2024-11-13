<?php

namespace App\Http\Controllers;

use App\Models\Publisher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;

class PublisherController extends Controller
{
    //
    public function index(){
        $publishers = Publisher::paginate(10);
        return view('publishers.list',compact('publishers'));
    }
    public function store(Request $request){
        $title = 'Add Book Publisher';
        if($request->isMethod('POST')){
            $request->validate(
                [
                    'publisher_name' => 'required|unique:publishers,publisher_name'
                ],
                [
                    'publisher_name.required' => "Tên nhà xuất bản không được để trống",
                    'publisher_name.unique' => "Nhà xuất bản đã tồn tại"
                ]
            );
            $params = $request->except('_token');
            $publishser = Publisher::create($params);
            if($publishser->id){
                Session::flash('success', 'Add Publisher Successfully');
            }
        }
        return view('publishers.store', compact('title'));
    }

    public function update(Request $request, $id){
        $title = "Update Book Publisher";
        $publisher = DB::table('publishers')->where('id', $id)->first();
        if($request->isMethod('POST')){
            $request->validate(
                [
                    'publisher_name' => [
                        'required',
                        Rule::unique('publishers')->ignore($id)
                    ]
                ],
                [
                    'publisher_name.required' => "Tên nhà xuất bản không được để trống",
                    'publisher_name.unique' => "Nhà xuất bản đã tồn tại"
                ]
            );
            $params = $request->except('_token');
            $result = DB::table('publishers')->where('id', $id)->update($params);
            if($result){
                Session::flash('success', 'Update Publisher Successfully');
                return redirect()->route('edit_publisher', ['id' => $id]);
            }
        }

        return view('publishers.update', compact(['title', 'publisher']));
    }

    public function destroy($id){
        $publisherDL = Publisher::where('id',$id)->delete();
        if($publisherDL){
            Session::flash('success', 'Delete Publisher Successfully');
            return redirect()->route('publishers');
        }
    }
}
