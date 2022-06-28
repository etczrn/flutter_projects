import 'package:flutter/material.dart';
import 'package:secure_storage/models/storage_item.dart';
import 'package:secure_storage/widgets/textfield_decoration.dart';

class AddDataDialog extends StatelessWidget {
  AddDataDialog({Key? key}) : super(key: key);

  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ref.watch(storageServiceProvider.notifier);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _keyController,
              decoration: textFieldDecoration(hintText: "Enter Key"),
            ),
            TextFormField(
              controller: _valueController,
              decoration: textFieldDecoration(hintText: "Enter Value"),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // * In the above code, you used the _keyController and _valueController controllers
                      // * to create a new StorageItem object and return it to the home screen.
                      final StorageItem storageItem = StorageItem(
                          _keyController.text, _valueController.text);
                      Navigator.of(context).pop(storageItem);
                    },
                    child: const Text('Secure')))
          ],
        ),
      ),
    );
  }
}
