import 'package:flutter/material.dart';
import 'package:chattingapp/constants/constantsof.dart';
class EditText extends StatelessWidget {
  final String hint;
  final bool secure;
  final Function onChange;

  EditText({this.hint,this.secure,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        obscureText:secure,
        onChanged: onChange,
        textAlign: TextAlign.center,
        decoration: KtextFieldInput.copyWith(hintText:hint),
      ),
    );
  }
}
