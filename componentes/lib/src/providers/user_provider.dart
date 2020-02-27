import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// user data provider
class _UserProvider {
  String data;

  _UserProvider();
  
  // Async method require to return Future<T>
  Future<List<dynamic>> getData() async {
    // Load data from local file
    String content = await rootBundle.loadString("data/data.json");
    // Decode string to map
    Map mapContent = json.decode(content);
    // Get only user list
    List<dynamic> users = mapContent['users'];
    // Return user list
    return users;   
  }
}

final _UserProvider userProvider = _UserProvider();