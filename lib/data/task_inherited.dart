import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task(
        taskName: 'Aprender Flutter',
        image: 'assets/images/dart.png',
        difficulty: 3),
    Task(
        taskName: 'Andar de Bike',
        image: 'assets/images/flutter.png',
        difficulty: 2),
    Task(
        taskName: 'Meditar', image: 'assets/images/flutter.png', difficulty: 5),
    Task(taskName: 'Ler', image: 'assets/images/flutter.png', difficulty: 4),
    Task(taskName: 'Jogar', image: 'assets/images/flutter.png', difficulty: 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(taskName: name, image: photo, difficulty: difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
