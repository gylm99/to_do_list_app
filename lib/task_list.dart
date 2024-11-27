import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';
import 'package:to_do_list_app/task_card.dart';


class TaskList extends StatelessWidget {
  const TaskList({super.key,
  required this.tasks,
  required this.onTaskToggled
  });

  final List<Task> tasks;
  final Function(Task) onTaskToggled;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: tasks.length,
    itemBuilder: (ctx, index)=>TaskCard(task: tasks[index], onTaskUpdated: ()=>onTaskToggled(tasks[index])));
  }
  
}