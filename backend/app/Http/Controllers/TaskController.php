<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index(Request $request)
    {
        return response()->json(['data' => $request->user()->tasks()->latest()->get()]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'title'       => 'required|string|max:255',
            'description' => 'nullable|string',
            'due_date'    => 'nullable|date',
            'done'        => 'boolean',
        ]);

        $task = $request->user()->tasks()->create($data);
        return response()->json(['data' => $task], 201);
    }

    public function show(Task $task, Request $request)
    {
        if ($task->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Forbidden'], 403);
        }
        return response()->json(['data' => $task]);
    }

    public function update(Request $request, Task $task)
    {
        if ($task->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        $data = $request->validate([
            'title'       => 'sometimes|required|string|max:255',
            'description' => 'nullable|string',
            'due_date'    => 'nullable|date',
            'done'        => 'boolean',
        ]);

        $task->update($data);
        return response()->json(['data' => $task]);
    }

    public function destroy(Task $task, Request $request)
    {
        if ($task->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        $task->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
