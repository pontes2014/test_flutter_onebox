import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  TaskItem({
    required this.task,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
