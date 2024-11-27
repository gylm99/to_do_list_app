import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';
import 'package:to_do_list_app/new_task.dart';

import 'package:to_do_list_app/task_list.dart';

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

final List<Task> _registeredTasks = [
    Task(title: "Vásárlás", deadLine: DateTime.now().add(Duration(days: 1))),
    Task(title: "Futás", deadLine: DateTime.now().add(Duration(days: 2))),
    Task(title: "Tanulás Flutterhez", deadLine: DateTime.now().add(Duration(days: 3))),
  ];

  void _toggleTask(Task updatedTask) {
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      title: const Text("ToDoApp"),
      actions: [
        IconButton(onPressed: _openAddTrack, icon: const Icon(Icons.add))
      ],
    ),
    body: Column(children: [
      const Text("Feladatok"),
      Expanded(child: TaskList(tasks: _registeredTasks, onTaskToggled: _toggleTask))
    ],),
   );
    
  }

}