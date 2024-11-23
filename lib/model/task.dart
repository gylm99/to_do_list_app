import 'package:uuid/uuid.dart';

const uuid=Uuid();
class Task {
  Task({
    required this.title,
    this.isDone=false,
    required this.deadLine
  }):id=uuid.v4();

  final String id;
  final String title;
   bool isDone;
  final DateTime deadLine;

  void toggleCompleted(){
    isDone=!isDone;
  }
}