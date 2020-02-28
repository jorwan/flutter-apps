import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => Scaffold(
      appBar: AppBar(
        title: Text('Cards')
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _getCard1()
        ]
      ),
    );

  Widget _getCard1()
    => Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("The New Way to Build Mobile App"),
            subtitle: Text("Now you can lkjasd fasldk fjlaksjd flajs dlfkjas lkdjf lkasjd flkjas ldkfj alksdj flkasj ldkfjalksdjflkas df"),
            leading: Icon(Icons.info),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Read"),
                onPressed: (){},
              ),
              FlatButton(
                child: Icon(Icons.delete),
                onPressed: (){},
              )
            ],
          )
        ],
      )
    );
}