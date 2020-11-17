import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICOption extends StatelessWidget {
  final bool isSelected;
  final Function onPressed;
  final String option;
  final double width;

  const ICOption(
      {Key key,
      this.option,
      this.isSelected = false,
      this.onPressed,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 48,
      child: MaterialButton(
        // disabledColor: kNeoAccent.withOpacity(0.15),
        onPressed: () => onPressed(),
        color: isSelected ? kNeoAccent : Colors.white,
        highlightColor: kAccent,
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   side: BorderSide(
        //     color: isSelected,
        //   )
        // ),
        child: Text(option,
            style:
                isSelected ? kButtonsDisabledTextStyle : kMainButtonTextStyle),
      ),
    );
  }
}
