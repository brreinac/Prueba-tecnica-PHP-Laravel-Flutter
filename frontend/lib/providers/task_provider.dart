import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskProvider with ChangeNotifier {
  final ApiService api = ApiService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    final response = await api.getTasks();
    _tasks = (response.data as List)
        .map((taskJson) => Task.fromJson(taskJson))
        .toList();
    notifyListeners();
  }

  Future<void> addTask(String title, String description) async {
    await api.createTask({
      "title": title,
      "description": description,
      "status": "pendiente",
    });
    await fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await api.deleteTask(id);
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
