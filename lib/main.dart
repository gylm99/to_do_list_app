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
          surface: Colors.cyan[50],
          primary: Colors.cyan[600],
          secondary: Colors.tealAccent,
        ),
        scaffoldBackgroundColor: Colors.cyan[50],
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan[900]!,
          brightness: Brightness.dark,
        ).copyWith(
          surface: Colors.grey[850],
          primary: Colors.cyan[900],
          secondary: Colors.teal[300],
        ),
        scaffoldBackgroundColor: Colors.grey[850],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal[300],
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const TodoList(),
    );
  }
}