import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    DateTime? _selectedDate;
     final formatter = DateFormat.yMd();





void _presentDatePicker() async {
  final now = DateTime.now();
  final lastDate = DateTime(now.year+1, now.month, now.day);
  final pickedDate = await showDatePicker(
        context: context, firstDate: now, lastDate: lastDate);


     setState(() {
      _selectedDate = pickedDate;
    });
  }


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

                 Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : formatter
                          .format(_selectedDate!)), // kell a felkiáltó jel
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )),

           /*   const TextField(
                maxLength: 60,
                decoration: InputDecoration(
                label: Text('Task')
                )
              ),*/

             const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Visszatérés az újonnan létrehozott feladat objektummal.
                    Navigator.pop(context, Task(title: _taskController.text,
                        isDone: false,
                        deadLine: _selectedDate!)
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