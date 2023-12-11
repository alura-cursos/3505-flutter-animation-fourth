import 'dart:convert';

import 'package:faerun/domain/models/entry.dart';
import 'package:faerun/utils/consts/api.dart';
import 'package:flutter/services.dart';

class DataApi {
  List<Entry> entries = [];

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await readFile(fullPath: pathInfo + category);
    entries = List<Entry>.from(response["data"].map((e) => Entry.fromMap(e)));
    return entries;
  }

  Future<Map<String, dynamic>> readFile({required String fullPath}) async {
    String fileString = await rootBundle.loadString("$fullPath.json");
    return json.decode(fileString);
  }
}
