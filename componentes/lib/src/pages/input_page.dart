import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";

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
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: EdgeInsets.only(left: 20),
                  labelText: "Name",
                  hintText: "Name of User",
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.1)),
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
              SizedBox(
                height: 25,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    labelText: "Email",
                    contentPadding: EdgeInsets.only(left: 20),
                    icon: Icon(Icons.mail),
                    suffixIcon: Icon(Icons.mail_outline)),
                onChanged: (text) => setState(() {
                  _email = text;
                }),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: EdgeInsets.only(left: 20),
                  labelText: "Password",
                  suffixIcon: Icon(Icons.lock_outline),
                  icon: Icon(Icons.lock),
                  counterText: "${_nombre.length}",
                ),
              ),
              ListTile(
                title: Text("Nombre: $_nombre"),
              ),
              ListTile(
                title: Text("Email: $_email"),
              )
            ]));
  }
}
