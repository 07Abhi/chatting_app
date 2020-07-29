import 'package:chattingapp/screens/forgetpassword.dart';
import 'package:chattingapp/screens/splash_page.dart';
import 'package:chattingapp/screens/welcomepage.dart';
import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/registrationscreen.dart';
import 'screens/loginscreen.dart';
import 'screens/chatscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.id,
      routes: {
        SplashPage.id: (context) =>SplashPage(),
        WelcomePage.id: (context) => WelcomePage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ForgetPasssword.id:(context) =>ForgetPasssword()
      },
    );
  }
}
