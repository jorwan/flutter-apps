import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink; 

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(5.0);

  bool _play = false;

  int _speed = 1000;
  int _visibleSpeed = 10;
  int _maxSpeed = 110;
  int _minSpeed = 0;

  int _nextSpeed = 100;
  int _nextVisibleSpeed = 10;

  _AnimatedContainerPageState(){
    _nextVisibleSpeed = _nextSpeed ~/ 10;
  }

  @override
  Widget build(BuildContext context) {

    bool canIncrease = _visibleSpeed < _maxSpeed;
    bool canDecrease = _visibleSpeed > _minSpeed;

    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ), 
          duration: Duration(
            milliseconds: _speed ~/ 2
          ),
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: 25.0,),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.fast_rewind),
            backgroundColor: canDecrease ? Colors.blue : Colors.grey,
            onPressed: canDecrease ? () {
              if(_visibleSpeed > _minSpeed){
                setState(() {
                  _speed += _nextSpeed;
                  _visibleSpeed -= _nextVisibleSpeed; 
                });
              }
            }
            :
            null
          ),
          SizedBox(width: 5.0,),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.fast_forward),
            backgroundColor: canIncrease ? Colors.blue : Colors.grey,
            onPressed: canIncrease ? () {
              if(_visibleSpeed < _maxSpeed){
                setState(() {
                  _speed -= _nextSpeed;
                  _visibleSpeed += _nextVisibleSpeed; 
                });
              }
            }
            :
            null
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Speed", 
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("$_visibleSpeed")
            ]
          ),
          Expanded(child: SizedBox()),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.pause),
            backgroundColor: _play ? Colors.blue : Colors.grey,
            onPressed: _play ? () {
              setState(() {
                _play = false;
              });
            }
            : null
          ),
          SizedBox(
            width: 5.0,
          ),
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            backgroundColor: !_play ? Colors.blue : Colors.grey,
            onPressed: !_play ? _updateContainer : null
          )
        ],
      ),
    );
  }

  void _updateContainer() async {
    setState(() {
      _play = true;
    });
    while(_play){
      
      await Future.delayed(Duration(milliseconds:_speed));
      
      if(!mounted){
        _play = false;
        break;
      }
      
      Random random = Random();
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble(); 
      setState(() {
        double minValue = 60.0;
        _color = Color.fromRGBO(
          random.nextInt(255), 
          random.nextInt(255), 
          random.nextInt(255), 
          random.nextDouble()
        );
        _borderRadius = BorderRadius.circular(
          random.nextInt(50).toDouble() + 30
        );
      });
    }
  }
}