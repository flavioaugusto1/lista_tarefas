import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacity = true;

  hideAndShowTask() {
    setState(() {
      opacity = !opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          "Tarefas",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: const Duration(milliseconds: 400),
          child: ListView(
            children: const [
              Task(
                taskName: "Aprender flutter",
                image:
                    "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                difficulty: 3,
              ),
              Task(
                taskName: "Aprender dart",
                image:
                    "https://img.icons8.com/?size=100&id=7AFcZ2zirX6Y&format=png&color=000000",
                difficulty: 3,
              ),
              Task(
                taskName: "Conseguir a primeira vaga mobile",
                image:
                    "https://images.unsplash.com/photo-1432888498266-38ffec3eaf0a?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                difficulty: 5,
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
                image:
                    "https://img.icons8.com/?size=100&id=24465&format=png&color=000000",
                difficulty: 4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          hideAndShowTask();
        },
        child: Icon(opacity ? Icons.toggle_on : Icons.toggle_off_outlined),
      ),
    );
  }
}
