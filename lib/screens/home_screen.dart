import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/data/level_inherited.dart';
import 'package:meu_primeiro_projeto/data/task_inherited.dart';
import 'package:meu_primeiro_projeto/screens/form_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double level = 0;
  double progressBar = 0;

  updateLevelAndProgressBar() {
    LevelInherited.of(context).updateOverallLevel();
    setState(() {
      level = LevelInherited.of(context).levelTotal;
      progressBar = LevelInherited.of(context).progressBarOverall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tarefas",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: LevelInherited.of(context).progressBarOverall,
                      ),
                    ),
                  ),
                  Text(
                    "Level: ${LevelInherited.of(context).levelTotal.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        LevelInherited.of(context).updateOverallLevel();
                      });
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.only(top: 10),
          children: TaskInherited.of(context).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
