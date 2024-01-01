import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Entry {
  final int amount;
  final String? note;
  final String name;
  final storage = const FlutterSecureStorage();


  Entry({
    required this.amount,
    this.note,
    required this.name,
  });

  Entry.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        note = json['note'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'note': note,
    'name': name,
  };
}