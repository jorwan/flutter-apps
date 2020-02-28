import 'package:flutter/material.dart';

import 'package:componentes/src/config/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: router.getInitialRoute(),
      routes: router.getRoutes(),
      onGenerateRoute: router.onGenerateRoute(),
    );
  }
}