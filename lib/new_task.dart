import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/model/task.dart';



class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});

  final void Function(Task task) onAddTask;

  @override
  State<StatefulWidget> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _taskController = TextEditingController();
  DateTime? _selectedDeadline;
  final _formatter = DateFormat.yMd();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final futureDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: futureDate,
    );

    setState(() {
      _selectedDeadline = pickedDate;
    });
  }

  void _submitTaskData() {
    if (_taskController.text.trim().isEmpty || _selectedDeadline == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Hibás bemenet"),
          content: const Text(
            "Kérlek, adj meg egy nevet és válassz egy határidőt.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddTask(
      Task(
        title: _taskController.text.trim(),
        isDone: false,
        deadLine: _selectedDeadline!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _taskController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Feladat neve'),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDeadline == null
                    ? 'Nincs határidő kiválasztva'
                    : 'Határidő: ${_formatter.format(_selectedDeadline!)}',
              ),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Mégse'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _submitTaskData,
                child: const Text('Feladat mentése'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}












































/*class NewTask extends StatefulWidget{
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
      appBar: AppBar(title: const Text('Új Feladat')),
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
                        deadLine: DateTime.now()));
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
}*/

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