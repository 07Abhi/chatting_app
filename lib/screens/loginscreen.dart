import 'package:chattingapp/screens/chatscreen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/components/widgets.dart';
import 'package:chattingapp/constants/constantsof.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final _authLogin = FirebaseAuth.instance;
  final detailsTextControlleremail = TextEditingController();
  final detailsTextControllerpassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '️Login',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Image.asset(
                'images/logo.png',
                height: 200.0,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            TextField(
              controller: detailsTextControlleremail,
              keyboardType: TextInputType.emailAddress,
              obscureText:false,
              onChanged: (value){
                  email = value;
              },
              textAlign: TextAlign.center,
              decoration: KtextFieldInput.copyWith(hintText: 'Enter email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: detailsTextControllerpassword,
              obscureText:true,
              onChanged: (value){
                password = value;
              },
              textAlign: TextAlign.center,
              decoration: KtextFieldInput.copyWith(hintText: 'Enter password'),
            ),
            SizedBox(
              height: 30.0,
            ),
            WelcomeButton(
              buttonText: 'Log In',
              onTap: () async{
                setState(() {
                  showSpinner = true;
                });
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                try{
                  final loginUser = await _authLogin.signInWithEmailAndPassword(email: email, password: password);
                  setState(() {
                    showSpinner = false;
                  });
                  if(loginUser!=null){
                    Fluttertoast.showToast(msg: 'Welcome',
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 15.0);
                    Navigator.pushNamed(context, ChatScreen.id);
                    detailsTextControlleremail.clear();
                    detailsTextControllerpassword.clear();
                  }
                }catch(e){
                  setState(() {
                    showSpinner = false;
                  });
                  Fluttertoast.showToast(msg: 'Invalid Credentials',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor:Colors.black54,
                  textColor: Colors.white,
                  fontSize: 15.0);
                  print(e);
                }
              },
              color: Colors.blue.shade500,
            )
          ],
        ),
      ),
    );
  }
}

