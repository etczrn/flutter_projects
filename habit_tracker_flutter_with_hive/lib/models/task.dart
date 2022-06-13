import 'package:hive/hive.dart';

// * TypeId should be different for each model class that we want to use in Hive.
@HiveType(typeId: 0)
class Task {
  // * The reason why I've chosen to declare these variables as final is
  // * that it is a good idea to make model classes immutable
  // * so that there are less chances that we modify this data
  // * when we are not supposed to. (e.g. inside widget classes)
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String iconName;
  // final bool completed;

  Task(this.id, this.name, this.iconName);
}
