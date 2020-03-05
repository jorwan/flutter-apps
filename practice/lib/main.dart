import 'package:flutter/material.dart';
import 'package:practice/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => MaterialApp(
      home: HomePage(),
    );
}