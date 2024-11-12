// lib/screens/add_task_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isImportant = false;

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final newTask = Task(
        title: titleController.text,
        description: descriptionController.text,
        isImportant: isImportant,
      );
      Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter a task title' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter a description' : null,
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('Mark as Important'),
                value: isImportant,
                onChanged: (value) {
                  setState(() {
                    isImportant = value;
                  });
                },
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: _saveTask,
                  child: Text('Save Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
