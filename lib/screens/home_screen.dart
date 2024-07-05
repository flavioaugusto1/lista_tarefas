import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/task.dart';
import 'package:meu_primeiro_projeto/data/level_inherited.dart';
import 'package:meu_primeiro_projeto/data/task_dao.dart';
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
        title: const Text(
          "Tarefas",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 10),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando...")
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando...")
                    ],
                  ),
                );
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando...")
                    ],
                  ),
                );
              case ConnectionState.done:
                print(snapshot);
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final Task task = items[index];
                        return task;
                      },
                    );
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          "Não há tarefas cadastradas.",
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return const Text("Erro ao carregar tarefas.");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              )).then(
            (value) => setState(() {
              print("Recarregando a tela...");
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
