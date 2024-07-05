import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/task.dart';
import 'package:uuid/uuid.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [];
  var uuid = const Uuid().v4();

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(
      id: uuid,
      taskName: name,
      image: photo,
      difficulty: difficulty,
    ));
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
