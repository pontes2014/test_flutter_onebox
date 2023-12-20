import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_onebox/presentation/state/task_state.dart';
import 'package:test_flutter_onebox/presentation/widgets/add_task_button.dart';
import 'package:test_flutter_onebox/presentation/widgets/task_list_card.dart';

class InfoCaptureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TaskListCard(),
            ),
            AddTaskButton(),
          ],
        ),
      ),
    );
  }

  void _showEditTaskDialog(BuildContext context, String task) {
    TextEditingController _editTaskController =
        TextEditingController(text: task);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _editTaskController,
                decoration: const InputDecoration(
                  labelText: 'Editar Tarefa',
                  hintText: 'Edite sua tarefa',
                ),
              ),
             const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Provider.of<TaskState>(context, listen: false)
                      .updateTask(task, _editTaskController.text);
                  Navigator.pop(context); // Fechar o diálogo
                },
                child: const Text('Salvar Edição'),
              ),
            ],
          ),
        );
      },
    );
  }
}
