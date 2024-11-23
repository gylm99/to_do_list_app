import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/model/Task.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Function(Task) onTaskUpdated;

  const TaskCard({
    super.key,
    required this.task,
    required this.onTaskUpdated,
  });

  @override
  State<StatefulWidget> createState() {
    return _TaskCard();
  }
}


class _TaskCard extends State<TaskCard>{

  void _toggleTaskCompletion() {
    setState(() {
      widget.task.toggleCompleted();
    });
    widget.onTaskUpdated(widget.task);
  }


  @override
  Widget build(BuildContext context) {
      return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: widget.task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Határidő: ${DateFormat('yyyy-MM-dd').format(widget.task.deadLine)}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: widget.task.isDone,
              onChanged: (bool? value) {
                _toggleTaskCompletion();
              },
            ),
          ],
        ),
      ),
    );
  }
}