import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/difficulty.dart';
import 'package:meu_primeiro_projeto/data/level_inherited.dart';
import 'package:meu_primeiro_projeto/data/task_dao.dart';

class Task extends StatefulWidget {
  final String id;
  final String taskName;
  final String image;
  final int difficulty;

  Task({
    this.id = '',
    required this.taskName,
    required this.image,
    required this.difficulty,
    super.key,
  });

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Color handleColor = Colors.cyan;

  incrementLevel() {
    widget.nivel++;
  }

  changeProgessBar() {
    final random = Random();
    Color blueColor = Colors.blue;
    Color blackColor = Colors.black;
    Color redColor = Colors.red;
    Color greenColor = Colors.green;
    Color purpleColor = Colors.purple;
    Color brownColor = Colors.brown;
    Color pinkColor = Colors.pink;

    List<Color> listColors = [
      blueColor,
      blackColor,
      redColor,
      greenColor,
      purpleColor,
      brownColor,
      pinkColor,
    ];
    handleColor = listColors[random.nextInt(listColors.length)];

    return handleColor;
  }

  resetProgressBar() {
    return widget.nivel = 0;
  }

  int nivel2 = 0;
  incrementProgressBar() {
    if (widget.difficulty > 0) {
      double finalDifficulty = (widget.nivel / widget.difficulty) / 10;

      LevelInherited.of(context).acumulateOverAllLevel(
          overallLevel: widget.nivel, difficultyTask: widget.difficulty);

      if (finalDifficulty == 1) {
        changeProgessBar();
        return resetProgressBar();
      }

      return finalDifficulty;
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
              color: handleColor,
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
                      decoration: const BoxDecoration(
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
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.taskName,
                            style: const TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.difficulty,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              incrementLevel();
                            });
                          },
                          onLongPress: () {
                            TaskDao().delete(widget.id);
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: incrementProgressBar(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Nível: ${widget.nivel}",
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
