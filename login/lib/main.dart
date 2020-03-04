import 'package:flutter/material.dart';

main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
    => MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final double _topBarHeight = 24.0;
  double _topRightBorder = 200.0;
  double _bottomLeftBorder = 200.0;

  Color _topColor = Colors.red;
  Color _bottomColor = Colors.blue;

  bool _next = true;

  List<Map<String, dynamic>> _animationSettings;
  int _animationSettingsIndex = 0;

  @override
  void initState(){
    super.initState();
    
    _animationSettings = [
      {
        '_topRightBorder'    : 200.0,
        '_bottomLeftBorder'  : 200.0
      },
      {
        '_topRightBorder'    : 50.0,
        '_bottomLeftBorder'  : 50.0
      }
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) => animateLoginPage());
  }

  void animateLoginPage() {
    setState(() {
      _bottomLeftBorder = _animationSettings[_animationSettingsIndex]['_bottomLeftBorder'];
      _topRightBorder = _animationSettings[_animationSettingsIndex]['_topRightBorder'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.purple,
        onPressed: (){
          setState(() {
            _animationSettingsIndex = (_next = !_next) ? 0 : 1;
            animateLoginPage();
          });
        },
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: _topBarHeight,),
            Container(
              height: (MediaQuery.of(context).size.height - _topBarHeight) / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: _bottomColor
              ),
              child: AnimatedContainer(
                height: (MediaQuery.of(context).size.height - _topBarHeight) / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: _topColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_bottomLeftBorder)
                  )
                ),
                duration: Duration(milliseconds: 800),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: _topColor
                ),
                child: AnimatedContainer(
                  height: (MediaQuery.of(context).size.height - _topBarHeight) / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: _bottomColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(_topRightBorder)
                    )
                  ), 
                  duration: Duration(milliseconds: 800),
                ),
              ),
            ),
          ]
        ),  
      ),
    );
  }
}