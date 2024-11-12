// lib/providers/task_provider.dart
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy groceries', description: 'Milk, Eggs, Bread', isImportant: true),
    Task(title: 'Finish project', description: 'Complete Flutter app', isCompleted: true),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // Notify listeners to update the UI
  }

  void toggleTaskCompletion(Task task) {
    task.toggleCompleted();
    notifyListeners();
  }

  void toggleTaskImportant(Task task) {
    task.toggleImportant();
    notifyListeners();
  }
}
