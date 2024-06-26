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
                image: "../assets/images/dart.png",
                difficulty: 3,
              ),
              Task(
                taskName: "Aprender dart",
                image: "../assets/images/flutter.png",
                difficulty: 3,
              ),
              Task(
                taskName: "Conseguir a primeira vaga mobile",
                image: "../assets/images/job.png",
                difficulty: 5,
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
                image: "../assets/images/swift.png",
                difficulty: 4,
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
                image: "../assets/images/swift.png",
                difficulty: 4,
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
                image: "../assets/images/swift.png",
                difficulty: 4,
              ),
              Task(
                taskName: "Aprender uma das tecnologias nativas",
                image: "../assets/images/swift.png",
                difficulty: 4,
              ),
              SizedBox(
                height: 80,
              )
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
