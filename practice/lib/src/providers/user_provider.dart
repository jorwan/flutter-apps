import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _UserProvider {
  _UserProvider();

  Future<List<dynamic>> getData() async {
    // Get file data
    String data = await rootBundle.loadString('data/data.json');
    // Parse data string to map
    Map mapData = json.decode(data);
    // Get only data array
    List<dynamic> users = mapData['data'];

    return users;
  }
}

final _UserProvider userProvider = _UserProvider();