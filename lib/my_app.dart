import 'package:flutter/material.dart';
import 'package:todo_list/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',

      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.indigo),
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}
