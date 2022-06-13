import 'package:habit_tracker_flutter/models/task.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  Future<void> init() async {
    const tasksBoxName = 'tasks';

    // * First: initialize Hive
    await Hive.initFlutter();

    // * Second: Register adapters
    Hive.registerAdapter<Task>(TaskAdapter());

    // * Third: Open boxes
    // * The name is used when reading/writing data
    await Hive.openBox<Task>(tasksBoxName);
  }
}
