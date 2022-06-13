import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // * We can use this line to read data from the box
    // * but all the Hive-specific code should be inside a domain-specific API -> HiveDataStore
    // final box = Hive.box<Task>(HiveDataStore.tasksBoxName);

    // * We should use only one data store for the entire application
    // * using dependency injection (riverpod or inherited widget or similar)
    // * but for the sake of simplicity we'll create another instance of the data store
    // * and this is temporary solution
    final dataStore = HiveDataStore();

    return ValueListenableBuilder(
        valueListenable: dataStore.tasksListenable(),
        builder: (_, Box<Task> box, __) =>
            TasksGridPage(tasks: box.values.toList()));
  }
}
