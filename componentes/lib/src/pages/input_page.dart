import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Input"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        children: <Widget>[
          SizedBox(height: 25,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              contentPadding: EdgeInsets.only(left: 20),
              labelText: "Name",
              hintText: "Name of User",
              hintStyle: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.1)
              ),
              helperText: "Ex. Jorge",
              suffixIcon: Icon(Icons.person),
              icon: Icon(Icons.account_circle),
              counterText: "${_nombre.length}",
            ),
            onChanged: (text) {
              setState(() {
                _nombre = text;
              });
            },
          ),
          ListTile(
            title: Text("Nombre: $_nombre"),
          )
        ]
      )
    );
  }
}