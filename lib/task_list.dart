import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';
import 'package:to_do_list_app/task_card.dart';
import 'package:to_do_list_app/new_task.dart';


class TaskList extends StatefulWidget {
  const TaskList({super.key,
  required this.tasks,
  required this.onTaskAdded,
  required this.onTaskToggled,
  required this.onTaskDeleted
  });

  final List<Task> tasks;
  final Function(Task) onTaskToggled;
  final Function(Task) onTaskAdded;
  final Function(Task) onTaskDeleted;

  @override
  _TaskListState createState() => _TaskListState();

}

class _TaskListState extends State<TaskList> {
  void _removeTask(Task task) {
    setState(() {
      widget.tasks.remove(task); // A task eltávolítása a listából
    });
  }

  void _addTask(Task newTask) {
    setState(() {
      widget.tasks.add(newTask); // Új feladat hozzáadása a listához
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Feladatok')
      ),
      body: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (ctx, index) => TaskCard(
          task: widget.tasks[index],
          onTaskUpdated: () => widget.onTaskToggled(widget.tasks[index]),
          onTaskDeleted: () => _removeTask(widget.tasks[index]),
            // Feladat törlési logika
          onTaskAdded: () => _addTask(widget.tasks[index]) //Feladat hozzáadása
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Új feladat hozzáadása
          /*
          Task? newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTask()),
          );
          if (newTask != null) {
            widget.onTaskAdded(newTask);
          }
           */
          final result = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewTask()),
          );
          if (result != null && result is Task) {
            _addTask(result);  // Hívd meg a metódust ami hozzáadja az új feladatot
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}