import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tarefas",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Task(
                taskName: "Aprender flutter",
              ),
              Task(
                taskName: "Aprender dart",
              ),
              Task(
                taskName: "Conseguir a primeira vaga mobile",
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String taskName;
  const Task({
    required this.taskName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          color: Colors.blueAccent,
        ),
        Container(
          height: 100,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 72,
                color: Colors.black26,
              ),
              Text(taskName),
              ElevatedButton(
                  onPressed: () {}, child: const Icon(Icons.arrow_drop_up))
            ],
          ),
        )
      ],
    );
  }
}
