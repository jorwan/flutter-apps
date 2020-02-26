import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle textStyle = TextStyle(fontSize: 25);

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
              '0',
              style: textStyle
            )
          ],
        ),
      )
    );
  }
}