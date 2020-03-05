import 'package:flutter/material.dart';

main() => runApp(
  MaterialApp(
    home: LoginPage(),
  )
);

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
  int _animationSettingsIndex = 1;

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
    var _bottomLinearGradient = LinearGradient(
      colors: <Color>[
        Colors.yellow[900],
        Colors.yellow[600],
        Colors.yellow[400],
      ]
    );
    var _topLinearGradient = LinearGradient(
      colors: <Color>[
        Colors.orange[900],
        Colors.orange[600],
        Colors.orange[400],
      ]
    );

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
            // SizedBox(height: _topBarHeight,),
            Container(
              height: (MediaQuery.of(context).size.height - _topBarHeight) / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: _topLinearGradient
              ),
              child: AnimatedContainer(
                height: (MediaQuery.of(context).size.height - _topBarHeight) / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: _bottomLinearGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_bottomLeftBorder)
                  )
                ),
                duration: Duration(milliseconds: 800),
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: <Color>[
                        Colors.orange[900],
                        Colors.orange[600],
                      ]
                    ).createShader(bounds),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: _bottomLinearGradient,
                  color: _topColor
                ),
                child: AnimatedContainer(
                  height: (MediaQuery.of(context).size.height - _topBarHeight) / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: _bottomColor,
                    gradient: _topLinearGradient,
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