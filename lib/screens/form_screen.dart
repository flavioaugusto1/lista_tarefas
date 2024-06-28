import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDifficultyController = TextEditingController();
  TextEditingController taskImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova tarefa"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 850,
            width: 450,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Escreva o nome da tarefa",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                    controller: taskNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Escreva a dificuldade em números",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                    controller: taskDifficultyController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {});
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Selecione a imagem desejada",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                    controller: taskImageController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      taskImageController.text,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          '../assets/images/notfound.webp',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(taskNameController.text);
                      print(int.parse(taskDifficultyController.text));
                      print(taskImageController);
                    },
                    child: Text("Adicionar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
