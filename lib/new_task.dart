import 'package:flutter/material.dart';

class NewTask extends StatefulWidget{
  const NewTask({super.key});

  @override
  State<StatefulWidget> createState() {

    return _NewTrack();
  }

}

class _NewTrack extends State<NewTask>{
  @override
  Widget build(BuildContext context) {
   
    return(const Padding(
      padding:  EdgeInsets.all(16),
    ));
  }
}