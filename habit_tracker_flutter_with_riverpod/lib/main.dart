import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/home_page.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();

  // * The HomePage can now access the HiveDataStore with ref.watch(),
  // * but in the main() file we're still creating a separate HiveDataStore.
  // * We can address this by using a dependency override:
  // * 1. Create the HiveDataStore just onece
  // * (and make it available with a data store provider)
  // * 2. This is created asynchronously,
  // * so the provider should 'throw UnimplementedError()' by default
  // * 3. Override the provider once the data store is created and initialized
  final dataStore = HiveDataStore();
  await dataStore.init();
  await dataStore.createDemoTasks(
    tasks: [
      Task.create(name: 'Take Vitamins', iconName: AppAssets.vitamins),
      Task.create(name: 'Cycle to Work', iconName: AppAssets.bike),
      Task.create(name: 'Wash Your Hands', iconName: AppAssets.washHands),
      Task.create(name: 'Wear a Mask', iconName: AppAssets.mask),
      Task.create(name: 'Brush Your Teeth', iconName: AppAssets.toothbrush),
      Task.create(name: 'Floss Your Teeth', iconName: AppAssets.dentalFloss),
    ],
    force: false,
  );
  // * First: Wrap the entire app in a Provider.
  // * ProviderScope is a container for all the providers that we will use in out app.
  runApp(ProviderScope(
    overrides: [
      dataStoreProvider.overrideWithValue(dataStore),
    ],
    child: MyApp(),
  ));
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
