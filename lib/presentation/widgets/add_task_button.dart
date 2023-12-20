import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_onebox/presentation/state/task_state.dart';

class AddTaskButton extends StatefulWidget {
  @override
  _AddTaskButtonState createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Text('Adicionar Tarefa'),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Nova Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  labelText: 'Nova Tarefa',
                  hintText: 'Digite sua nova tarefa',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String task = _taskController.text.trim();
                  if (task.isNotEmpty) {
                    Provider.of<TaskState>(context, listen: false)
                        .addTask(task);
                    Navigator.pop(context);
                    _taskController.clear();
                  } else {
                    _showEmptyTaskAlert(context);
                  }
                },
                child: const Text('Adicionar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEmptyTaskAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Campo em Branco'),
          content: Text('O campo de tarefa não pode ficar em branco.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
