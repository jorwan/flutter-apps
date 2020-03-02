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
          _getCard1(),
          SizedBox(
            height: 30.0,
          ),
          _getCard2(context)
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

  Widget _getCard2(BuildContext context)
    => Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 25.0,
            offset: Offset(10.0, 10.0),
            spreadRadius: -10.0
          )
        ]
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.0
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 250.0,
              width: MediaQuery.of(context).size.width - 10,
              fadeInDuration: Duration(milliseconds: 10000),
              fit: BoxFit.fitHeight,
              image: AssetImage('images/landscape.jpg'),
              placeholder: AssetImage('images/loading.gif'),
            ),
          )
          // Image(
          //   image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/8/81/Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg')
          // )
        ],
      ),
    );
}