import 'package:flutter/material.dart';
import 'package:todoey_review/models/task.dart';

class Database extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: 'خرید هفته', isDone: false),
    Task(title: 'سر زدن به اقوام', isDone: false),
    Task(title: 'مطالعه کتاب', isDone: false)
  ];

  void addTask (String newText) {
    final newTask = Task(title: newText, isDone: false);
    tasks.add(newTask);
    notifyListeners();
  }

  void deleteTask (int indexTask) {
    tasks.remove(tasks[indexTask]);
    notifyListeners();
  }
}
