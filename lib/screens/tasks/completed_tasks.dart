// lib/screens/tasks/completed_tasks.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../providers/task_provider.dart';

class CompletedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedTasks = Provider.of<TaskProvider>(context)
        .tasks
        .where((task) => task.isCompleted)
        .toList();

    return ListView.builder(
      itemCount: completedTasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: completedTasks[index]);
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(decoration: TextDecoration.lineThrough)),
      subtitle: Text(task.description),
      leading: Icon(Icons.check_circle, color: Colors.green),
    );
  }
}
