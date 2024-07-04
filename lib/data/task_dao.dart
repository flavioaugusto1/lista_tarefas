import 'package:meu_primeiro_projeto/components/task.dart';
import 'package:meu_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_idTask TEXT, '
      '$_nameTask TEXT, '
      '$_difficultyTask INTEGER, '
      '$_imageTask TEXT)';

  static const String _tablename = 'taskTable';
  static const String _idTask = 'id';
  static const String _nameTask = 'name';
  static const String _difficultyTask = 'difficulty';
  static const String _imageTask = 'image';

  save(Task task) async {
    final Database database = await getDataBase();
    var itemExists = await find(task.id);
    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      return await database.insert(_tablename, taskMap);
    } else {
      return await database.update(
        _tablename,
        taskMap,
        where: '$_idTask = ?',
        whereArgs: [_idTask],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_idTask] = task.id;
    taskMap[_nameTask] = task.taskName;
    taskMap[_difficultyTask] = task.difficulty;
    taskMap[_imageTask] = task.image;

    return taskMap;
  }

  Future<List<Task>> findAll() async {
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskList) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> data in taskList) {
      final Task task = Task(
        id: data[_idTask],
        taskName: data[_nameTask],
        image: data[_imageTask],
        difficulty: data[_difficultyTask],
      );

      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> find(String taskName) async {
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_idTask = ?',
      whereArgs: [_idTask],
    );

    return toList(result);
  }

  delete(String taskName) async {}
}
