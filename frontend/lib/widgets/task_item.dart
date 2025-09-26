import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../providers/auth_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return ListTile(
      title: Text(task.title,
          style: TextStyle(
              decoration: task.completed ? TextDecoration.lineThrough : null)),
      leading: Checkbox(
        value: task.completed,
        onChanged: (value) {
          task.completed = value ?? false;
          taskProvider.updateTask(task, auth.token!);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          taskProvider.deleteTask(task.id, auth.token!);
        },
      ),
    );
  }
}
