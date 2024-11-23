
import 'package:flutter/material.dart';
import 'package:to_do_list_app/new_task.dart';
import 'package:to_do_list_app/model/task.dart';

class TodoList extends StatefulWidget{
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() {

    return _TodoList();
  }

  
}



class _TodoList extends State<TodoList>{

  void _openAddTrack(){
  showModalBottomSheet(context: context, builder: (ctx)=>new NewTask());
}

final List<Task> _tasks = [
    Task(title: "Vásárlás", deadLine: DateTime.now().add(Duration(days: 1))),
    Task(title: "Futás", deadLine: DateTime.now().add(Duration(days: 2))),
    Task(title: "Tanulás Flutterhez", deadLine: DateTime.now().add(Duration(days: 3))),
  ];

  void _updateTask(Task updatedTask) {
    setState(() {
      final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
      if (index != -1) {
        _tasks[index] = updatedTask;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      title: const Text("Feladatok"),
      actions: [
        IconButton(onPressed: _openAddTrack, icon: const Icon(Icons.add))
      ],
    ),
    body: const Column(children: [
      Text("Category"),
      Text("ToDoList")

    ],),
   );
    
  }

}