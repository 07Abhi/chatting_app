import 'package:chattingapp/main.dart';
import 'package:chattingapp/screens/registrationscreen.dart';
import 'package:chattingapp/screens/welcomepage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static final String id = 'splashPageID';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, WelcomePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                height: 200.0,
                width: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Flash Chat',
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
