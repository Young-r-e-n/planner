// lib/screens/tasks/important_tasks.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../providers/task_provider.dart';

class ImportantTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final importantTasks = Provider.of<TaskProvider>(context)
        .tasks
        .where((task) => task.isImportant)
        .toList();

    return ListView.builder(
      itemCount: importantTasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: importantTasks[index]);
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
      leading: Icon(Icons.star, color: Colors.amber),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (bool? value) {
          Provider.of<TaskProvider>(context, listen: false).toggleTaskCompletion(task);
        },
      ),
    );
  }
}
