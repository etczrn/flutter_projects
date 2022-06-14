import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const tasksBoxName = 'tasks';

// * [Creating and using a TaskState Hive model class]
// * Add some new methods to our HiveDataStore class
// * so that we can read and write TaskState objects
  static const tasksStateBoxName = 'tasksState';
  static String taskStateKey(String key) => 'taskState/$key';

  Future<void> init() async {
    await Hive.initFlutter();
    // register adapters
    Hive.registerAdapter<Task>(TaskAdapter());
    // * Step 2 requires to update the init() method inside HiveDataStore:
    Hive.registerAdapter<TaskState>(TaskStateAdapter());
    // open boxes
    await Hive.openBox<Task>(tasksBoxName);
    await Hive.openBox<Task>(tasksStateBoxName);
  }

  Future<void> createDemoTasks({
    required List<Task> tasks,
    bool force = false,
  }) async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isEmpty || force) {
      await box.clear();
      await box.addAll(tasks);
    } else {
      print('Box already has ${box.length} items');
    }
  }

  ValueListenable<Box<Task>> tasksListenable() {
    return Hive.box<Task>(tasksBoxName).listenable();
  }

  Future<void> setTaskState({
    required Task task,
    required bool completed,
  }) async {
    final box = Hive.box<TaskState>(tasksStateBoxName);
    final taskState = TaskState(taskId: task.id, completed: completed);
    await box.put(taskStateKey(task.id), taskState);
  }

  ValueListenable<Box<TaskState>> taskStateListenable({required Task task}) {
    final box = Hive.box<TaskState>(tasksStateBoxName);
    final key = taskStateKey(task.id);

    return box.listenable(keys: <String>[key]);
  }
}

// * Second: Create provider
// * Provider is a box that contains an object of a certain type.
// * Once we have created a provider, we can assign a provider to a global identifier
// * that can be accessed by reference
final dataStoreProvider = Provider<HiveDataStore>((ref) {
  // return HiveDataStore();
  throw UnimplementedError();
});
