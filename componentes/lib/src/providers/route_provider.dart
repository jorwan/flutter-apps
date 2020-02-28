import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// user data provider
class _RouteProvider {
  String data;

  _RouteProvider();
  
  // Async method require to return Future<T>
  Future<List<dynamic>> getRoutes() async {
    // Load data from local file
    String content = await rootBundle.loadString("data/routes.json");
    // Decode string to map
    Map mapContent = json.decode(content);
    // Get only route list
    List<dynamic> routes = mapContent['routes'];
    // Return route list
    return routes;
  }
}

final _RouteProvider routeProvider = _RouteProvider();