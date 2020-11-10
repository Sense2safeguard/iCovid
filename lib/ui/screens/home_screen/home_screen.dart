import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/components/ic_app_bar.dart';
import 'package:iCovid/ui/components/ic_buttons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: Column(
          children: [
            ICAppBar(accentTitle: "i", lightBlueTitle: "COVID"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "iCOVID App is an easy and fast way to assess your potential for infection and advise you on it. All anonymously.",
                      style: kBodyText2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 36),
                    Text(
                      "Why i?",
                      style: kheadline3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 36),
                    Text(
                      "Because iCOVID infection and complications risk assessment is interactive, integrative, innovative, intelligent, internet-based, individual, informative, instructive",
                      style: kBodyText2,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    ICMainButton(
                      onPressed: () {},
                      text: "Start Quiz",
                    ),
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
