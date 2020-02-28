import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';

// Set initial route to call on run app
final String initialRoute = '/';

// List of routes in app
final Map<String, Widget Function(BuildContext context)> _routes = {
  '/'       : (BuildContext context) => HomePage(),
  'alert'   : (BuildContext context) => AlertPage(),
  'avatar'  : (BuildContext context) => AvatarPage()
};

class Router {
  String _initialRoute;

  Router(){
    this._initialRoute = '/';
  }

  String getInitialRoute() => _initialRoute;

  Map<String, Widget Function(BuildContext context)> getRoutes() => _routes;
}

final Router router = Router();