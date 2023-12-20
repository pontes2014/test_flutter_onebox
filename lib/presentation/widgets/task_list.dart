import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_onebox/presentation/state/task_state.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskState>(
      builder: (context, taskState, _) {
        return ListView.builder(
          itemCount: taskState.tasks.length,
          itemBuilder: (context, index) {
            return TaskItem(
              task: taskState.tasks[index],
              onDelete: () {
                _showDeleteTaskDialog(
                    context, taskState, taskState.tasks[index]);
              },
              onEdit: () {
                _showEditTaskDialog(context, taskState, taskState.tasks[index]);
              },
            );
          },
        );
      },
    );
  }

  void _showEditTaskDialog(
      BuildContext context, TaskState taskState, String task) {
    TextEditingController _editedTaskController =
        TextEditingController(text: task);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: TextField(
            controller: _editedTaskController,
            decoration: InputDecoration(
              labelText: 'Editar Tarefa',
              hintText: 'Edite sua tarefa',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                taskState.updateTask(task, _editedTaskController.text);
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('Salvar Edição'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteTaskDialog(
      BuildContext context, TaskState taskState, String task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir Tarefa'),
          content: Text('Tem certeza de que deseja excluir a tarefa?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                taskState.deleteTask(task);
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('Sim, Excluir'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }
}
