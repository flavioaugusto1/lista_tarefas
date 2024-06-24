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
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
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
    );
  }
}

class Task extends StatefulWidget {
  final String taskName;
  final String image;
  final int difficulty;

  Task({
    required this.taskName,
    required this.image,
    required this.difficulty,
    super.key,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  incrementLevel() {
    nivel++;
  }

  incrementProgressBar() {
    if (widget.difficulty > 0) {
      return (nivel / widget.difficulty) / 10;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.black26,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.taskName,
                            style: const TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.difficulty >= 1)
                                  ? Colors.black
                                  : Colors.black45,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.difficulty >= 2)
                                  ? Colors.black
                                  : Colors.black45,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.difficulty >= 3)
                                  ? Colors.black
                                  : Colors.black45,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.difficulty >= 4)
                                  ? Colors.black
                                  : Colors.black45,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.difficulty >= 5)
                                  ? Colors.black
                                  : Colors.black45,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              incrementLevel();
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text("UP", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: incrementProgressBar(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Nível: $nivel",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
