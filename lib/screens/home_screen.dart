import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/task.dart';
import 'package:meu_primeiro_projeto/screens/form_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Task(
              taskName: "Aprender flutter",
              image: "../assets/images/dart.png",
              difficulty: 1,
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
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const FormScreen();
            },
          ));
          // hideAndShowTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
