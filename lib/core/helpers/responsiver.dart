import 'package:flutter/material.dart';

// Sizes for reference
// Size modelSize = Size(365, 667);
// Size emulator = Size(392, 759);
// Size iphoneSE = Size(320, 544);

/// This class will provide with different sizes
/// to ensure responsiveness across different devices
class Responsiver {
  final BuildContext context;

  Responsiver({this.context}) {
    initialize();
  }

  Size _size;
  Size get size => _size;
  bool _isBig;
  bool get isBig => _isBig;

  void initialize() {
    _size = MediaQuery.of(context).size;
    _isBig = size.width > 340 && size.height > 570;
    // _isBig = false;
  }

  //
  // GENERAL
  EdgeInsets get generalPadding => EdgeInsets.symmetric(
      horizontal: _isBig ? _size.width * 0.1 : _size.width * 0.07,
      vertical: _isBig ? _size.height * 0.025 : _size.height * 0.015);

  double get mediumVertical =>
      _isBig ? _size.height * 0.04 : _size.height * 0.03;
  double get smallVertical =>
      _isBig ? _size.height * 0.025 : _size.height * 0.015;
  double get smallestVertical =>
      _isBig ? _size.height * 0.012 : _size.height * 0.009;

  // double get mediumHorizontal =>
  //     _isBig ? _size.height * 0.04 : _size.height * 0.03;
  double get smallHorizontal =>
      _isBig ? _size.width * 0.05 : _size.width * 0.04;
  double get smallestHorizontal =>
      _isBig ? _size.width * 0.02 : _size.height * 0.01;

  //
  // PRIVACY POLICY SCREEN
  double get privacyContainerHeight =>
      _isBig ? _size.height * 0.75 : _size.height * 0.5;

  //
  // HOME SCREEN
  double get appBarHeight => _isBig ? _size.height * 0.07 : _size.height * 0.06;

  //
  // QUIZ SCREEN
  EdgeInsets get quizBodyPadding => EdgeInsets.symmetric(
      horizontal: _isBig ? _size.width * 0.1 : _size.width * 0.07);

  double get icQuestionContainerHeight =>
      _isBig ? size.height * 0.69 : size.height * 0.5;

  EdgeInsets get icQuestionMainBodyPadding => _isBig
      ? EdgeInsets.fromLTRB(
          size.width * 0.06, size.height * 0.04, size.width * 0.06, 0)
      : EdgeInsets.fromLTRB(
          size.width * 0.04, size.height * 0.03, size.width * 0.04, 0);

  double get insideQuestionContainerHeight =>
      _isBig ? size.height * 0.4 : size.height * 0.3;

  double get icSingleCheckableButtonHeight =>
      _isBig ? size.height * 0.063 : size.height * 0.063;
  double get icSingleCheckableExtraSpace =>
      _isBig ? size.height * 0.05 : size.height * 0.04;

  //
  // RESULTS SCREEN
  EdgeInsets get resultsMainBodyPadding => EdgeInsets.fromLTRB(
      size.width * 0.046,
      size.height * 0.02,
      size.width * 0.046,
      size.height * 0.01);

  //
  // POST ASSESSMENT SCREEN
  double get postAssessmentContainerHeight =>
      _isBig ? size.height * 0.69 : size.height * 0.5;

  double get rounderHeaderHight =>
      _isBig ? size.height * 0.26 : size.height * 0.19;

  EdgeInsets get rounderHeaderTopPadding =>
      EdgeInsets.only(top: _isBig ? size.height * 0.05 : size.height * 0.02);

  EdgeInsets get postAssessmentOptionsPadding => _isBig
      ? EdgeInsets.fromLTRB(
          size.width * 0.08, size.height * 0.04, size.width * 0.08, 0)
      : EdgeInsets.fromLTRB(size.width * 0.08, 0, size.width * 0.08, 0);

  //
  // SHARED COMPONENTS
  double get mainButtonHeight =>
      _isBig ? size.height * 0.063 : size.height * 0.053;
  double get mainButtonWidth => _isBig ? size.width * 0.3 : size.width * 0.25;

  double get icRadioSelectionHeight =>
      _isBig ? size.height * 0.04 : size.height * 0.04;

  double get icRadioSelectionWidth =>
      _isBig ? size.width * 0.32 : size.width * 0.28;

  double get cardWidth => size.width * 0.63;

  double get cardHeight => size.height * 0.15;
}
