import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 5.0, 5.0, 5.0),
            child: ClipOval(
              child: FadeInImage(
                fit: BoxFit.cover,
                width: 45.0,
                image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg/800px-Stan_Lee_by_Gage_Skidmore_3.jpg'),
                placeholder: AssetImage('images/loading.gif'),
              ),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
}