import 'package:chattingapp/components/widgets.dart';
import 'package:chattingapp/screens/forgetpassword.dart';
import 'package:chattingapp/screens/registrationscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'loginscreen.dart';

class WelcomePage extends StatefulWidget {
  static const String id = "welcome_Screen";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

//here we extends the class with stateless along with SingleTickerProvider.
class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation;
  List<String> appName = ['Flash Chat'];

  @override
  void initState() {
    //here vsync takes an object of its own class.
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1), upperBound: 1.0);
//    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
//    animation.addStatusListener((status) {
//      if(status ==AnimationStatus.completed){
//        controller.reverse(from:1.0);
//      }
//      else if(status==AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });
    //controller.reverse(from: 1.0);
    controller.addListener(() {
      setState(() {});
    });
  }

//this will close the animation when the welcome screen goes off.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    height: 80.0,
                    width: 80.0,
                  ),
                  TypewriterAnimatedTextKit(
                    text: appName,
                    totalRepeatCount: 1,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 50.0,
                        color: Colors.black54,
                        fontFamily: 'Ubuntu'),
                    speed: Duration(seconds: 1),
                    //pause: Duration(seconds: 1), this is for making our animation pause
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              WelcomeButton(
                buttonText: 'Log In',
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color: Colors.cyan,
              ),
              WelcomeButton(
                buttonText: 'Register',
                onTap: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                color: Colors.blue.shade800,
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasssword.id);
                },
                child: Text(
                  'Forget Passsword?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Ubuntu',
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
