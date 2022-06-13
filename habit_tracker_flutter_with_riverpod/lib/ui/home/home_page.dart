import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerWidget {
  // * BuildContext is similart to WidgetRef
  // * BuildContext
  // * - Use 'context' to access ancestor widgets (e.g. Navigator, MediaQuery, etc.)
  // * - BuildContext works INSIDE the widget tree
  // * WidgetRef
  // * - Use 'ref' to access all providers
  // * - Riverpod providers are defined in the global scope
  // * and live OUTSIDE the widget tree
  // * - Access providers by reference
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * By using ref.watch(), our widget will rebuild every time
    // * the Provider's value changes
    // * and this is useful for providers that hold state
    // * (e.g. StateNotifierProvider, FutureProvider, StreamProvider)
    final dataStore = ref.watch(dataStoreProvider);

    return ValueListenableBuilder(
        valueListenable: dataStore.tasksListenable(),
        builder: (_, Box<Task> box, __) =>
            TasksGridPage(tasks: box.values.toList()));
  }
}
