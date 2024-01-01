import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trip_calculator/data/entries.dart';
import 'package:trip_calculator/data/entry.dart';

class AddEntryForm extends StatefulWidget {
  const AddEntryForm({super.key, required Entries entries});

  @override
  State<AddEntryForm> createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  var dropdownValue = 'Shakil';
  var list = ['Shakil', 'Asad'];
  final storage = const FlutterSecureStorage();

  Future<void> addEntry() async {
    if(_amountController.text.isEmpty) {
      return;
    }

    var entry = Entry(
      amount: int.parse(_amountController.text),
      note: _noteController.text,
      name: dropdownValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _amountController,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownMenu<String>(
                  width: MediaQuery.of(context).size.width - 48,
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Enter a note',
                border: OutlineInputBorder(),
                labelText: 'Note',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  addEntry();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Submit')
              ),
            ),
          ],
        ),
      ),
    );
  }
}