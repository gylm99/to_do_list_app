import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task.dart';

class NewTask extends StatefulWidget{
  const NewTask({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewTaskState();
    //return _NewTrack();
  }
}

class _NewTaskState extends State<NewTask> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Új Feladat')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Feladat neve'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kérlek adj meg egy nevet.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Visszatérés az újonnan létrehozott feladat objektummal.
                    Navigator.pop(context, Task(title: _taskController.text,
                        isDone: false,
                        deadLine: DateTime.now())
                    );
                  }
                },
                child: const Text('Feladat hozzáadása'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _NewTrack extends State<NewTask>{
  @override
  Widget build(BuildContext context) {
   
    return(const Padding(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 60,
            decoration: InputDecoration(
              label: Text('Task')
            ),
          )
        ],
      ),
    ));
  }
}
 */