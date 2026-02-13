import 'package:flutter/material.dart';
import 'package:todo_list/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',

      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.indigo),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}
