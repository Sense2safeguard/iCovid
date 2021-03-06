import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/models/data_structure_models.dart';

class ICAppBar extends StatelessWidget {
  final Question question;
  ICAppBar({this.question});

  @override
  Widget build(BuildContext context) {
    Responsiver responsiver = Responsiver(context: context);

    String _accentTitle = "i";
    String _lightBlueTitle = "COVID";

    if (question != null && question.category != null) {
      switch (question.category) {
        case "Demographics":
          _accentTitle = "iCO";
          _lightBlueTitle = "VID";
          break;
        case "Co-morbidities":
          _accentTitle = "iC";
          _lightBlueTitle = "OVID";
          break;
        case "Viral":
          _accentTitle = "iCOV";
          _lightBlueTitle = "ID";
          break;
        case "International":
          _accentTitle = "iCOVI";
          _lightBlueTitle = "D";
          break;
        case "Social Distancing":
          _accentTitle = "iCOVID";
          _lightBlueTitle = "";
          break;
        default:
          _accentTitle = "iCOVID";
          _lightBlueTitle = "";
      }
    }

    return Container(
      height: responsiver.appBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8),
        child: Stack(
          children: [
            // buildCloseButton(),
            buildLogo(_accentTitle, _lightBlueTitle, responsiver),
          ],
        ),
      ),
    );
  }

  Align buildLogo(
      String accentTitle, String lightBlueTitle, Responsiver responsiver) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: accentTitle,
                style: kheadline4.copyWith(
                    color: kNeoAccent,
                    fontWeight: FontWeight.w800,
                    fontSize: responsiver.isBig ? 29 : 26)),
            TextSpan(
                text: lightBlueTitle,
                style: kheadline4.copyWith(
                    color: kLightBlue,
                    fontWeight: FontWeight.w800,
                    fontSize: responsiver.isBig ? 29 : 26)),
          ],
        ),
      ),
    );
  }

  // Align buildCloseButton() {
  //   return Align(
  //     alignment: Alignment.centerLeft,
  //     child: RawMaterialButton(
  //       splashColor: kAccent,
  //       constraints: BoxConstraints.expand(width: 32, height: 32),
  //       onPressed: () => SystemNavigator.pop(),
  //       shape: CircleBorder(),
  //       fillColor: Colors.white.withOpacity(0.3),
  //       child: Icon(Icons.close, color: Colors.white, size: 16),
  //     ),
  //   );
  // }
}
