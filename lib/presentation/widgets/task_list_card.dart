import 'package:flutter/material.dart';
import 'task_list.dart';

class TaskListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          ListTile(
            title: Text('Tarefas'),
          ),
          Divider(),
          Expanded(
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
