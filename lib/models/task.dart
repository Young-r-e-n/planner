// lib/models/task.dart
class Task {
  String title;
  String description;
  bool isImportant;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isImportant = false,
    this.isCompleted = false,
  });

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  void toggleImportant() {
    isImportant = !isImportant;
  }
}
