import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle textStyle = TextStyle(fontSize: 25);
  final int contador = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de Clicks:',
              style: textStyle
            ),
            Text(
              '$contador',
              style: textStyle
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Clicked!!');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}