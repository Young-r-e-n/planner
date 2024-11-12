// lib/screens/tasks/all_tasks.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../providers/task_provider.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: tasks[index]);
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
      title: Text(task.title),
      subtitle: Text(task.description),
      leading: Icon(task.isImportant ? Icons.star : Icons.task),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (bool? value) {
          Provider.of<TaskProvider>(context, listen: false).toggleTaskCompletion(task);
        },
      ),
    );
  }
}
