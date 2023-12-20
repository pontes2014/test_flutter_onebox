import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskState extends ChangeNotifier {
  List<String> _tasks = [];

  List<String> get tasks => List.from(_tasks);

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTasks = prefs.getStringList('tasks') ?? [];
    _tasks = savedTasks;
    _notifyListeners();
  }

  Future<void> addTask(String task) async {
    _tasks.add(task);
    await _saveTasks();
  }

  Future<void> deleteTask(String task) async {
    _tasks.remove(task);
    await _saveTasks();
  }

  Future<void> updateTask(String oldTask, String newTask) async {
    final index = _tasks.indexOf(oldTask);
    if (index != -1) {
      _tasks[index] = newTask;
      await _saveTasks();
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', _tasks);
    _notifyListeners();
  }

  void _notifyListeners() {
    notifyListeners();
  }
}
