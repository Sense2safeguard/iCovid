import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICMainButton extends StatelessWidget {
  final bool isDisabled;
  final Function onPressed;
  final String text;
  final double width;

  ICMainButton(
      {this.isDisabled = false,
      this.onPressed,
      @required this.text,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 115,
      height: 48,
      child: MaterialButton(
        disabledColor: kNeoAccent.withOpacity(0.15),
        onPressed: isDisabled ? null : onPressed,
        color: kNeoAccent,
        highlightColor: kAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text,
            style:
                isDisabled ? kButtonsDisabledTextStyle : kMainButtonTextStyle),
      ),
    );
  }
}

class ICSecondaryButton extends StatelessWidget {
  final bool isDisabled;
  final Function onPressed;
  final String text;
  final double width;

  ICSecondaryButton(
      {this.isDisabled = false,
      this.onPressed,
      @required this.text,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 115,
      height: 48,
      child: MaterialButton(
          disabledColor: kNeoAccent.withOpacity(0.15),
          onPressed: isDisabled ? null : onPressed,
          color: Colors.white,
          highlightColor: kAccent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: kAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(text,
              style: isDisabled
                  ? kButtonsDisabledTextStyle
                  : kSecondaryButtonTextStyle)),
    );
  }
}
