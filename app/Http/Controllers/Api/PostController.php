<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PostController extends Controller
{
    public function index()
    {
        return response()->json(Post::with('author')->latest()->get());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title'   => 'required|string|max:255',
            'slug'    => 'nullable|string|unique:posts,slug',
            'content' => 'required|string',
            'image'   => 'nullable|string',
            'user_id' => 'required|exists:users,id'
        ]);
        if(empty($validated['slug'])) {
            $validated['slug'] = Str::slug($validated['title']);
        }
        $post = Post::create($validated);
        return response()->json($post, 201);
    }

    public function show(Post $post)
    {
        $post->load('author');
        return response()->json($post);
    }

    public function update(Request $request, Post $post)
    {
        $validated = $request->validate([
            'title'   => 'sometimes|required|string|max:255',
            'slug'    => 'sometimes|string|unique:posts,slug,'.$post->id,
            'content' => 'sometimes|required|string',
            'image'   => 'nullable|string',
        ]);
        $post->update($validated);
        return response()->json($post);
    }

    public function destroy(Post $post)
    {
        $post->delete();
        return response()->json(null, 204);
    }
}
