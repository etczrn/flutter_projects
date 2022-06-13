import 'package:habit_tracker_flutter/models/task.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const tasksBoxName = 'tasks';

  Future<void> init() async {
    // * First: initialize Hive
    await Hive.initFlutter();

    // * Second: Register adapters
    Hive.registerAdapter<Task>(TaskAdapter());

    // * Third: Open boxes
    // * The name is used when reading/writing data
    await Hive.openBox<Task>(tasksBoxName);
  }

  Future<void> createDemoTasks({
    required List<Task> tasks,
    bool force = false,
  }) async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isEmpty || force) {
      await box.clear();
      // * All the data will be added to this box and persisted to local storage
      await box.addAll(tasks);
    } else {
      print('Box already has ${box.length} iems');
    }
  }
}
