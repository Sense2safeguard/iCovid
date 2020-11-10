import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';

class ICMainButton extends StatelessWidget {
  final Function onPressed;
  final String state;
  final String text;

  ICMainButton({this.onPressed, this.state, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 48,
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.red,
        highlightColor: Colors.red,
        splashColor: Colors.red,
        child: Text(text, style: kButtonTextStyle),
      ),
    );
  }
}
