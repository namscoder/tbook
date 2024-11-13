<?php

namespace App\Http\Controllers;

use App\Models\Author;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class AuthorController extends Controller
{
    //
    public function index(){
        $authors = Author::paginate(10);
        return view('authors.list',compact('authors'));
    }
    public function store(Request $request){
        $title = 'Add Book Author';
        if($request->isMethod('POST')){
            $request->validate(
                [
                    'author_name' => 'required',
                    'gender' => 'required'
                ],
                [
                    'author_name.required' => "Tên tác giả không được để trống",
                    'gender.required' => "Giới tính tác giả phải được chọn",
                ]
            );
            $params = $request->except('_token');
            $author = Author::create($params);
            if($author->id){
                Session::flash('success', 'Add Author Successfully');
            }
        }
        return view('authors.store', compact('title'));
    }

    public function update(Request $request, $id){
        $title = "Update Book Author";
        $author = DB::table('authors')->where('id', $id)->first();
        if($request->isMethod('POST')){
            $request->validate(
                [
                    'author_name' => 'required',
                    'gender'=>'required'
                ],
                [
                    'author_name.required' => "Tên tác giả không được để trống",
                    'gender.required' => "Giới tính tác giả phải được chọn",
                ]
            );
            $params = $request->except('_token');
            $result = DB::table('authors')->where('id', $id)->update($params);

            if($result){
                Session::flash('success', 'Update Author Successfully');
                return redirect()->route('edit_author', ['id' => $id]);
            }
        }

        return view('authors.update', compact(['title', 'author']));
    }

    public function destroy($id){
        $authorDL = Author::where('id',$id)->delete();
        if($authorDL){
            Session::flash('success', 'Delete Author Successfully');
            return redirect()->route('authors');
        }
    }
}
