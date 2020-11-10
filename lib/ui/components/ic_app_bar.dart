import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';

class ICAppBar extends StatelessWidget {
  final String accentTitle;
  final String lightBlueTitle;
  ICAppBar({this.accentTitle, this.lightBlueTitle});

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
            Align(
              alignment: Alignment.centerLeft,
              child: RawMaterialButton(
                constraints: BoxConstraints.expand(width: 42, height: 42),
                onPressed: () {},
                shape: CircleBorder(),
                fillColor: Colors.white.withOpacity(0.3),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: accentTitle,
                        style: kheadline4.copyWith(
                            color: kAccent,
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
            ),
          ],
        ),
      ),
    );
  }
}
