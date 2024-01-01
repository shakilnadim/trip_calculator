import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trip_calculator/data/entries.dart';
import 'package:trip_calculator/widgets/addEntryForm.dart';

class Calculations extends StatefulWidget {
  const Calculations({super.key, required this.title});

  final String title;

  @override
  State<Calculations> createState() => _CalculationsState();
}

class _CalculationsState extends State<Calculations> {
  Entries entries = Entries([]);

  @override
  void initState() {
    super.initState();
    loadStoredEntries();
  }

  Future<void> loadStoredEntries() async {
    var storage = const FlutterSecureStorage();
    String? storageEntries = await storage.read(key: 'entries');

    if(storageEntries != null) {
      setState(() {
        var json = jsonDecode(storageEntries);
        entries = Entries.fromJson(json);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: const Column(
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (BuildContext context) {
              return AddEntryForm(entries: entries);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}