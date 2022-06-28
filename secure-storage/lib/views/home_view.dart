import 'package:flutter/material.dart';
import 'package:secure_storage/models/storage_item.dart';
import 'package:secure_storage/services/storage_service.dart';
import 'package:secure_storage/widgets/add_data_dialog.dart';
import 'package:secure_storage/widgets/search_key_value_dialog.dart';
import 'package:secure_storage/widgets/vault_card.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // * To use the SecureStorageService, initialize the StorageService instance:
  final StorageService _storageService = StorageService();
  late List<StorageItem> _items;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    initList();
  }

  // * you are using the readAllSecureData method to update and set the list in the initState.
  // * This will auto-update the home screen
  // * if the data exits as we already have a ListView.builder widget
  // * rendering each list item using the VaultCard widget.
  void initList() async {
    _items = await _storageService.readAllSecureData();
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () => showDialog(
                context: context, builder: (_) => const SearchKeyValueDialog()),
          )
        ],
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _items.isEmpty
                ? const Text("Add data in secure storage to display here.")
                : ListView.builder(
                    itemCount: _items.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: Key(_items[index].toString()),
                        child: VaultCard(item: _items[index]),
                        onDismissed: (direction) async {
                          await _storageService
                              .deleteSecureData(_items[index])
                              .then((value) => _items.removeAt(index));
                          initList();
                        },
                      );
                    }),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    // * 1. newItem: added a nullable StorageItem object coming from the AddDataDialog widget
                    final StorageItem? newItem = await showDialog<StorageItem>(
                        context: context, builder: (_) => AddDataDialog());
                    if (newItem != null) {
                      // * 2. Passed the newItem object into the writeSecureData method to write new data
                      _storageService.writeSecureData(newItem).then((value) {
                        setState(() {
                          _loading = true;
                        });
                        // * 3. Used the initList method to fetch all the existing data from secure storage
                        initList();
                      });
                    }
                  },
                  child: const Text("Add Data"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () async {
                    _storageService
                        .deleteAllSecureData()
                        .then((value) => initList());
                  },
                  child: const Text("Delete All Data"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
