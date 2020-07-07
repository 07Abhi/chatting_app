import 'package:chattingapp/screens/chatscreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/components/widgets.dart';
import 'package:chattingapp/constants/constantsof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_page";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '️Registration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            fontFamily: 'Ubuntu',
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                height: 200.0,
              ),
              SizedBox(
                height: 60.0,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                onChanged: (value) {
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration: KtextFieldInput.copyWith(hintText: 'Enter email'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                //keyboardType:,
                controller: passwordController,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                textAlign: TextAlign.center,
                decoration:
                    KtextFieldInput.copyWith(hintText: 'Enter password'),
              ),
              SizedBox(
                height: 30.0,
              ),
              WelcomeButton(
                buttonText: 'Register',
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  /*it will tae sometime to get authorized that's why we used async type*/
                  if (password.length > 6) {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Fluttertoast.showToast(
                          msg: 'Registration Done!!',
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          backgroundColor: Colors.black54,
                          fontSize: 15.0,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        Navigator.pushNamed(context, ChatScreen.id);
                        emailController.clear();
                        passwordController.clear();
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (exception) {
                     setState(() {
                       showSpinner = false;
                     });
                    }
                  } else {
                    if (password.length < 6) {
                      setState(() {
                        showSpinner = false;
                      });
                      Fluttertoast.showToast(
                          msg: 'Password must be at least of 6 Character',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 15.0);
                    }
                  }
                },
                color: Colors.blue.shade800,
              )
            ],
          ),
        ),
      ),
    );
  }
}
