import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trip_calculator/data/entry.dart';

class Entries {
  final List<Entry> entries;
  final storage = const FlutterSecureStorage();

  Entries(this.entries);

  factory Entries.fromJson(List<dynamic> json) {
    List<Entry> entries = [];
    entries = json.map((e) => Entry.fromJson(e)).toList();
    return Entries(entries);
  }
}