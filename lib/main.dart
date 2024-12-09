import 'package:flutter/material.dart';
import 'package:to_do_list_app/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan[600]!,
          brightness: Brightness.light,
        ).copyWith(
          primary: Colors.cyan[600],
          secondary: Colors.tealAccent,
          surface:  Colors.cyan[50],
          error: Colors.deepOrangeAccent,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white, // Fehér szöveg az AppBar-ban
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.cyan[50],
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.tealAccent,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: const TodoList(),
    );
  }
}