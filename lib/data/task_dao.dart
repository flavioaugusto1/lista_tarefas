import 'package:meu_primeiro_projeto/components/task.dart';
import 'package:meu_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {}
  Future<List<Task>> findAll() async {
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskList) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> data in taskList) {
      final Task task = Task(
        taskName: data[_name],
        image: data[_image],
        difficulty: data[_difficulty],
      );

      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> find(String taskName) async {}
  delete(String taskName) async {}
}
