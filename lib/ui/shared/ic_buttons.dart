import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICMainButton extends StatelessWidget {
  final bool isDisabled;
  final Function onPressed;
  final String text;
  final double width;
  final Color backgroundColor;

  ICMainButton(
      {this.isDisabled = false,
      this.onPressed,
      @required this.text,
      this.width,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 115,
      height: 48,
      child: MaterialButton(
        disabledColor: kNeoAccent.withOpacity(0.15),
        onPressed: onPressed,
        color: backgroundColor ?? kNeoAccent,
        highlightColor: kAccent,
        splashColor: Colors.white,
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
  final Color accentColor;

  ICSecondaryButton(
      {this.isDisabled = false,
      this.onPressed,
      @required this.text,
      this.width,
      this.accentColor});

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
            side: BorderSide(color: accentColor ?? kAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(text,
              style: isDisabled
                  ? kButtonsDisabledTextStyle
                  : accentColor != null
                      ? kSecondaryButtonTextStyle.copyWith(color: accentColor)
                      : kSecondaryButtonTextStyle)),
    );
  }
}
