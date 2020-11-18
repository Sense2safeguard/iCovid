import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/models/data_structure_models.dart';

class ICAppBar extends StatelessWidget {
  final Question question;
  ICAppBar({this.question});

  @override
  Widget build(BuildContext context) {
    String _accentTitle = "i";
    String _lightBlueTitle = "COVID";

    // TODO: better dartpad
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
        default:
      }
    }

    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8),
        child: Stack(
          children: [
            buildCloseButton(),
            buildLogo(_accentTitle, _lightBlueTitle),
          ],
        ),
      ),
    );
  }

  Align buildLogo(String accentTitle, String lightBlueTitle) {
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
                    fontSize: 29)),
            TextSpan(
                text: lightBlueTitle,
                style: kheadline4.copyWith(
                    color: kLightBlue,
                    fontWeight: FontWeight.w800,
                    fontSize: 29)),
          ],
        ),
      ),
    );
  }

  Align buildCloseButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RawMaterialButton(
        splashColor: kAccent,
        constraints: BoxConstraints.expand(width: 32, height: 32),
        onPressed: () {},
        shape: CircleBorder(),
        fillColor: Colors.white.withOpacity(0.3),
        child: Icon(Icons.close, color: Colors.white, size: 16),
      ),
    );
  }
}
