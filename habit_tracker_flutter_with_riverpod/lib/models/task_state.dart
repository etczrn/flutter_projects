import 'package:hive/hive.dart';

part 'task_state.g.dart';

// * [Creating and using a TaskState Hive model class]
// * 1. Create a TaskState model class that we can use with Hive, along with a type adapter
@HiveType(typeId: 1)
class TaskState {
  TaskState({required this.taskId, required this.completed});

  @HiveField(0)
  final String taskId;

  @HiveField(1)
  final bool completed;
}
