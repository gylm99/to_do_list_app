import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onTaskUpdated,
    required this.onTaskDeleted,
    required this.onTaskAdded
  });

  final Task task;
  final VoidCallback onTaskUpdated;
  final VoidCallback onTaskDeleted;
  final VoidCallback onTaskAdded;


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()), // Egyedi kulcs a task azonosítóval
      direction: DismissDirection.endToStart, // Csak jobbról balra lehet elhúzni
      onDismissed: (direction) {
        onTaskDeleted(); // Törlés visszahívása
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${task.title} törölve lett')),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
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
      ),
    );
  }
}




  /*
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
*/