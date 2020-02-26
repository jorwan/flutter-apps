import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  
  final TextStyle _textStyle = TextStyle(fontSize: 25);
  int _contador = 10;

  @override
  Widget build(BuildContext context){
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
              style: _textStyle
            ),
            Text(
              '$_contador',
              style: _textStyle
            )
          ],
        ),
      ),
      floatingActionButton: _getFloatingButtons()
    );
  }
      
  Widget _getFloatingButtons() {
    final _add = (int val) {
      _contador += val;
      setState(() {
        
      });
    };

    final _setToZero = () {
      _contador = 0;
      setState(() {
        
      });
    };

    final Row _floatingButtons = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 25,),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _setToZero,),
        Expanded(child: SizedBox(),),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: () {_add(-1);},),
        SizedBox(width: 5,),
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {_add(1);},),
      ],
    );
    return _floatingButtons;
  }
}