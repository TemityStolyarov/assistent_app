import 'package:assistent_app/data/models/task/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

//TODO Remove tasks before publishing
initDefaultTaskValues() {
  Hive.box('tasks').put(
    0,
    TaskModel(
      name: 'Важная задача',
      note: 'Ни в коем случае нельзя пропустить ее выполнение',
      isImportant: true,
      isDone: false,
    ),
  );
  Hive.box('tasks').put(
    1,
    TaskModel(
      name: 'Еще одна обычная задача',
      note: 'Сверстать на Flutter - еще проще, чем сделать дизайн, если честно',
      isImportant: false,
      isDone: false,
    ),
  );
  Hive.box('tasks').put(
    2,
    TaskModel(
      name: 'Выполненная важная задача',
      note: 'Сделать дизайн страницы - обычное легкое дело',
      isImportant: true,
      isDone: true,
    ),
  );
  Hive.box('tasks').put(
    3,
    TaskModel(
      name: 'Выполненная задача',
      note: 'Это было легко, не так ли?',
      isImportant: false,
      isDone: true,
    ),
  );
  Hive.box('tasks').put(
    4,
    TaskModel(
      name: 'Скрытая задача',
      note: 'Тсс, ее тут нет',
      isImportant: false,
      isDone: false,
    ),
  );
  Hive.box('tasks').put(
    5,
    TaskModel(
      name: 'Отложенная задача',
      note: 'Кто ж знал, что будет еще один параметр?',
      isImportant: false,
      isDone: false,
    ),
  );
}
