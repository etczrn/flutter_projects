import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/home_page.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

// * main() is a great place for any app startup logic (sync or async)
// * Everything will be ready by the time runApp() is called
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  // * Below takes care of initializing our data store
  final dataStore = HiveDataStore();
  await dataStore.init();
  // * Below code will create 6 tasks and store them with Hive
  // * the first time the application starts.
  await dataStore.createDemoTasks(tasks: [
    // Task.create(name: 'Walk the dog', iconName: AppAssets.dog),
    // Task.create(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
    // Task.create(name: 'Walk the Dog', iconName: AppAssets.dog),
    // Task.create(name: 'Do Some Coding', iconName: AppAssets.html),
    // Task.create(name: 'Meditate', iconName: AppAssets.meditation),
    // Task.create(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
    // Task.create(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
    Task.create(name: 'Go Swimming', iconName: AppAssets.swimmer),
    Task.create(name: 'Do Some Stretches', iconName: AppAssets.stretching),
    Task.create(name: 'Play Sports', iconName: AppAssets.basketball),
    Task.create(name: 'Spend Time Outside', iconName: AppAssets.sun),
  ], force: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
      ),
      home: AppTheme(
        data: AppThemeData.defaultWithSwatch(AppColors.red),
        child: HomePage(),
      ),
    );
  }
}
