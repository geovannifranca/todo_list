import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tarefas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(child: Text('Olá Mundo')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(children: [Icon(Icons.add), Text('Nova Tarefa')]),
      ),
    );
  }
}
