import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';

class ICAppBar extends StatelessWidget {
  final String accentTitle;
  final String lightBlueTitle;
  final bool hasCategory;
  ICAppBar({this.accentTitle, this.hasCategory, this.lightBlueTitle});

  @override
  Widget build(BuildContext context) {
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
            buildLogo(),
          ],
        ),
      ),
    );
  }

  Align buildLogo() {
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
