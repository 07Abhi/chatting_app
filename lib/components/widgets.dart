import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart'
    '';
class WelcomeButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final Color color;

  WelcomeButton({this.buttonText,this.onTap,this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: RawMaterialButton(
        fillColor: color,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}

