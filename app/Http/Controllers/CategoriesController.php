<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Redirect;

use App\Models\Category;

class CategoriesController extends Controller
{

    public function index()
    {

        $categories = Category::all()->map(function ($category) {
            return ['id'=>$category->id,'name' => $category->name, 'url' => route('categories.edit', $category)];
        });

        return Inertia::render('Dashboard/Categories/Index', ['categories' => $categories, 'url_create'=>route('categories.create')]);
    }

    public function create()
    {
        return Inertia::render('Dashboard/Categories/Create', ['url'=>route('categories.store')]);
    }


    public function store(Request $request)
    {
        $data = $request->validate(['name'=>'required']);

        Category::create($data);
        return Redirect::route('categories.index');
    }

    public function edit(Category $category)
    {
        return Inertia::render('Dashboard/Categories/Edit', ['category' => $category, 'url'=>route('categories.update', $category)]);
    }

    public function update(Request $request, Category $category)
    {
        $data = $request->validate(['name'=>'required']);

        $category->update($data);
        return Redirect::route('categories.index');

    }
}
