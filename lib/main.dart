import 'package:flutter/cupertino.dart';
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
        useMaterial3: false,
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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
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
              Task(
                taskName: "Aprender uma das tecnologias nativas",
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
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

class Task extends StatefulWidget {
  final String taskName;

  Task({
    required this.taskName,
    super.key,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            color: Colors.blueAccent,
          ),
          Column(
            children: [
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
                    Container(
                      width: 200,
                      child: Text(
                        widget.taskName,
                        style: TextStyle(
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                        });
                      },
                      child: Icon(Icons.arrow_drop_up),
                    )
                  ],
                ),
              ),
              Text(
                "Nível: $nivel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
