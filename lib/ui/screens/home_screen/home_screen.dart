import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/services/shared_preferences_service.dart';
import 'package:iCovid/ui/shared/ic_app_bar.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userUid = UserPreferences().userUid;
    bool haveAnswers = UserPreferences().questionOrder != null;
    bool isResumed = userUid != null && haveAnswers;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: Column(
          children: [ICAppBar(), buildBody(context, isResumed)],
        ),
      ),
    );
  }

  Expanded buildBody(BuildContext context, bool isResumed) {
    Responsiver responsiver = Responsiver(context: context);

    return Expanded(
      child: Padding(
        padding: responsiver.generalPadding,
        child: Column(
          children: [
            Spacer(),
            Text(
              "iCOVID App is an easy and fast way to assess your potential for infection and advise you on it. All anonymously.",
              style: kBodyText2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: responsiver.mediumVertical,
            ),
            Text(
              "Why i?",
              style: kheadline3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: responsiver.mediumVertical,
            ),
            Text(
              "Because iCOVID infection and complications risk assessment is interactive, integrative, innovative, intelligent, internet-based, individual, informative, instructive",
              style: kBodyText2,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ICMainButton(
              width: double.infinity,
              onPressed: () {
                Navigator.pushNamed(context, '/quiz-screen');
              },
              text: isResumed ? "Resume Quiz" : "Start Quiz",
            ),
          ],
        ),
      ),
    );
  }
}
