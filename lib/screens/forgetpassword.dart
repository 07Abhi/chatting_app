import 'package:chattingapp/components/widgets.dart';
import 'package:chattingapp/screens/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/constants/constantsof.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ForgetPasssword extends StatefulWidget {
  static const String id = 'forgetPassword';

  @override
  _ForgetPassswordState createState() => _ForgetPassswordState();
}

class _ForgetPassswordState extends State<ForgetPasssword> {
  final _authForget = FirebaseAuth.instance;
  String email;
  final textControllerForget = TextEditingController();
  bool showSpiner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: 'Ubuntu'),
        ),
      ),
      body: ModalProgressHUD(
        color: Colors.lightBlue,
        inAsyncCall: showSpiner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              height: 200.0,
              width: 100.0,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: textControllerForget,
                onChanged: (value) {
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration:
                    KtextFieldInput.copyWith(hintText: 'Your Registered Email'),
              ),
            ),
            WelcomeButton(
              buttonText: 'Send',
              onTap: () async {
                textControllerForget.clear();
                setState(() {
                  showSpiner = true;
                });
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                try {
                  await _authForget.sendPasswordResetEmail(email: email);
                  Fluttertoast.showToast(
                      msg: 'Reset link send on your Email',
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      fontSize: 15.0);
                  setState(() {
                    showSpiner = false;
                  });
                  Navigator.pushNamed(context, WelcomePage.id);
                } catch (e) {
                  setState(() {
                    showSpiner = false;
                  });
                  Fluttertoast.showToast(
                      msg: 'Some Error Occur!!',
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      fontSize: 15.0);
                }
              },
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
