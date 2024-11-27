import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onTaskUpdated,
  });

  final Task task;
  final VoidCallback onTaskUpdated; 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            task.toggleCompleted(); 
            onTaskUpdated(); 
          },
        ),
        title: Text(
          task.title,
          style: task.isDone
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough, 
                )
              : null,
        ),
        subtitle: Text("Határidő: ${task.deadLine.toString()}"),
      ),
    );
  }
}