import 'package:flutter/material.dart';

// TODO: unify approach and dry constants

Size modelSize = Size(392.7, 759.3);

// Widgets approach

/// _Original_: width: 20, height: 40
Widget generalPadding({Size currentDeviceSize, Widget child}) {
  const double horizontalPercentage = 0.1;
  const double verticalPercentage = 0.025;

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: currentDeviceSize.width * horizontalPercentage,
      vertical: currentDeviceSize.height * verticalPercentage,
    ),
    child: child,
  );
}

/// _Original_: width: _, height: 70
Widget bigSizedBoxVertical({Size currentDeviceSize}) {
  const double verticalPercentage = 0.09;

  return SizedBox(
    height: currentDeviceSize.height * verticalPercentage,
  );
}

/// _Original_: width: _, height: 36
Widget mediumSizedBoxVertical({Size currentDeviceSize}) {
  const double verticalPercentage = 0.04;

  return SizedBox(
    height: currentDeviceSize.height * verticalPercentage,
  );
}

/// _Original_: width: _, height: 20
Widget smallSizedBoxVertical({Size currentDeviceSize}) {
  const double verticalPercentage = 0.025;

  return SizedBox(
    height: currentDeviceSize.height * verticalPercentage,
  );
}

/// _Original_: width: _, height: 10
Widget smallestSizedBoxVertical({Size currentDeviceSize}) {
  const double verticalPercentage = 0.012;

  return SizedBox(
    height: currentDeviceSize.height * verticalPercentage,
  );
}

/// _Original_: width: 16, height: _
Widget smallSizedBoxHorizontal({Size currentDeviceSize}) {
  const double verticalPercentage = 0.04;

  return SizedBox(
    width: currentDeviceSize.width * verticalPercentage,
  );
}

/// _Original_: width: 10, height: _
Widget smallestSizedBoxHorizontal({Size currentDeviceSize}) {
  const double horizontalPercentage = 0.02;

  return SizedBox(
    width: currentDeviceSize.width * horizontalPercentage,
  );
}

// Constants approach

/// _Original_: width: 115, height: 48
double kMainButtonWidth(Size size) => size.width * 0.3;
double kMainButtonHeight(Size size) => size.height * 0.063;

/// _Original_: width: _, height: 56
double kAppBarHeight(Size size) => size.height * 0.07;

/// _Original_: width: 56, height: _
EdgeInsets kQuizBodyPadding(Size size) =>
    EdgeInsets.symmetric(horizontal: size.width * 0.1);

/// _Original_: width: 24, height: top 32, bottom _
EdgeInsets kQuestionMainBodyPadding(Size size) => EdgeInsets.fromLTRB(
    size.width * 0.06, size.height * 0.04, size.width * 0.06, 0);
EdgeInsets kQuestionMainPostAssessmentBodyPadding(Size size) =>
    EdgeInsets.fromLTRB(
        size.width * 0.08, size.height * 0.04, size.width * 0.08, 0);

/// _Original_: width: 16, height: top 16, bottom 8
EdgeInsets kResultsCardMainBodyPadding(Size size) => EdgeInsets.fromLTRB(
    size.width * 0.046,
    size.height * 0.02,
    size.width * 0.046,
    size.height * 0.01);

/// _Original_: width: _, height: 40
double kBottomRoundedHeaderTopPadding(Size size) => size.height * 0.05;

/// _Original_: width: 48, height: _
double kMainPaddingPosstAssessmentCenter(Size size) => size.width * 0.12;
