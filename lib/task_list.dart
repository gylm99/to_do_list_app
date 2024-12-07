import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';
import 'package:to_do_list_app/task_card.dart';
import 'package:to_do_list_app/new_task.dart';


class TaskList extends StatelessWidget {
  const TaskList({super.key,
  required this.tasks,
    required this.onTaskAdded,
  required this.onTaskToggled
  });

  final List<Task> tasks;
  final Function(Task) onTaskToggled;
  final Function(Task) onTaskAdded;

  /*
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: tasks.length,
    itemBuilder: (ctx, index)=>TaskCard(task: tasks[index], onTaskUpdated: ()=>onTaskToggled(tasks[index]), onTaskDeleted: () {  },));
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Feladatok')
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) => TaskCard(
          task: tasks[index],
          onTaskUpdated: () => onTaskToggled(tasks[index]),
          onTaskDeleted: () {
            // Feladat törlési logika
          }, onTaskAdded: () {  },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Új feladat hozzáadása
          Task? newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTask()),
          );
          if (newTask != null) {
            onTaskAdded(newTask);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}