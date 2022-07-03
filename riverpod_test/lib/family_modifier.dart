import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider =
// * .family is another modifier that we can use pass additional values to our providers.
// *This works by adding a second type annotation and an additional argument
// * that we can use inside the provider body.
    StreamProvider.autoDispose.family<int, int>((ref, offset) {
  return Stream.fromIterable([36 + offset, 72 + offset]);
});

// some model class
class Item {
  Item(this.id, this.name);

  final int id;
  final String name;
}

class Database {
  Stream<Item> itemStream(String itemId) {
    /* return a single item matching the given id */
    return Stream.value(Item(itemId.hashCode, 'Item $itemId'));
  }
}

final databaseProvider = Provider<Database>((ref) => Database());

// * 1. add an itemId argument with a family modifier
final itemStreamProvider =
    StreamProvider.autoDispose.family<Item, String>((ref, itemId) {
  // * 2. retrieve the database with ref.watch()
  final database = ref.watch(databaseProvider);
  // * 3. pass the itemId to the database method and return the output stream
  return database.itemStream(itemId);
  // * In this case, the itemStreamProvider can get the database via ref.watch(),
  // * and uses the itemId as an argument for the itemStream() method.
});

class ItemWidget extends ConsumerWidget {
  const ItemWidget({Key? key, required this.itemId}) : super(key: key);
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemAsyncValue = ref.watch(itemStreamProvider(itemId));
    return itemAsyncValue.when(
      data: (job) => Text(job.name),
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => Container(),
    );
  }
}
