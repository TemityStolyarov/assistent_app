import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final bool important;
  @HiveField(2)
  final bool isDone;
  @HiveField(3)
  final String? note;
  @HiveField(4)
  final DateTime? date;

  TaskModel({
    required this.name,
    required this.important,
    required this.isDone,
    this.note,
    this.date,
  });
}
