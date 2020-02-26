import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Welcome to Flutter Title',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter Appbar'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 5
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hellow World", 
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.red[300]
                    ),
                  ),
                ),
              ),
              // Text("data")
            ],
          )
        )
      ),
    ),
  );
}