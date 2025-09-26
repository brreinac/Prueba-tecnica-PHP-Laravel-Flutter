import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks(String token) async {
    final response = await ApiService.get("tasks", token: token);
    if (response.containsKey("data")) {
      _tasks = (response["data"] as List)
          .map((task) => Task.fromJson(task))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addTask(String title, String token) async {
    final response =
        await ApiService.post("tasks", {"title": title}, token: token);
    if (response.containsKey("data")) {
      _tasks.add(Task.fromJson(response["data"]));
      notifyListeners();
    }
  }

  Future<void> updateTask(Task task, String token) async {
    final response = await ApiService.put("tasks/${task.id}",
        {"title": task.title, "completed": task.completed}, token: token);
    if (response.containsKey("data")) {
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = Task.fromJson(response["data"]);
        notifyListeners();
      }
    }
  }

  Future<void> deleteTask(int id, String token) async {
    final response = await ApiService.delete("tasks/$id", token: token);
    if (response.containsKey("message")) {
      _tasks.removeWhere((t) => t.id == id);
      notifyListeners();
    }
  }
}
