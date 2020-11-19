import 'package:flutter/material.dart';

// TODO: make responsive proportions styles guide

// Colors
// Primary Palette
const kDarkBlue = Color(0xFF21314D);
const kLightBlue = Color(0xFF92A2BD);
const kAccent = Color(0xFFD2492A);
const kNeoAccent = Color(0xFFF36140);

// Secondary Palette
const kBlue = Color(0xFF263F6A);
const kPaleBlue = Color(0xFFCED5DD);
const kCoolGrey = Color(0xFFB2B4B3);
const kMettalic = Color(0xFF8B8D8E);

const kError = Color(0xFFFF6464);
Color kError50 = Color(0xFFFF6464).withOpacity(50);
Color kError20 = Color(0xFFFF6464).withOpacity(20);

const kSuccess = Color(0xFF3BD5A9);
Color kSuccess50 = Color(0xFF3BD5A9).withOpacity(50);
Color kSuccess20 = Color(0xFF3BD5A9).withOpacity(20);

const kInfo = Color(0xFF2799F9);
const kWarning = Color(0xFFFFC95C);

// Text Styles
// Titles
const kheadline3 = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white);
const kheadline4 = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: kDarkBlue);
const kheadline6 = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.white);

// Body
const kBodyText1 = TextStyle(
    fontFamily: "Open Sans",
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.white);
const kBodyText2 = TextStyle(
    fontFamily: "Open Sans",
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white);

// Components
// Buttons TextStyles
final kMainButtonTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white);

final kSecondaryButtonTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kNeoAccent);

final kButtonsDisabledTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kAccent.withOpacity(0.4));

// Selection Buttons
final kCheckedSelectionSelected = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white);

final kCheckedSelectionUnSelected = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kLightBlue);

final kPillSelectedTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white);

final kPillUnselectedTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: kPaleBlue);

// Others
final kOverlineTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white);

const kHintTextStyle = TextStyle(
    fontFamily: "Open Sans",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kLightBlue);

const kSelectedDateTextStyle = TextStyle(
    fontFamily: "Open Sans",
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: kNeoAccent);
