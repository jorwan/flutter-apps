import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';

// Set initial route to call on run app
final String initialRoute = '/';

// List of routes in app
final Map<String, Widget Function(BuildContext context)> _routes = {
  '/'       : (BuildContext context) => HomePage(),
  'alert'   : (BuildContext context) => AlertPage(),
  'avatar'  : (BuildContext context) => AvatarPage(),
  'card'    : (BuildContext context) => CardPage()
};

class Router {
  String _initialRoute;
  String _onFailRoute;

  Router(){
    this._initialRoute = '/';
    this._onFailRoute = 'alert';
  }

  String getInitialRoute() => _initialRoute;

  Map<String, Widget Function(BuildContext context)> getRoutes() => _routes;

  Route Function(RouteSettings setting) onGenerateRoute() 
    => (RouteSettings setting) => MaterialPageRoute(
    builder: _routes[_onFailRoute]
  );
}

final Router router = Router();