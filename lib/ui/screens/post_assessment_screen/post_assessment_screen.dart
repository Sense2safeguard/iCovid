import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/components/ic_post_assessments_options.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:iCovid/ui/shared/ic_bottom_rounded_header.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';
import 'package:iCovid/core/constants.dart';

class PostAssessmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuizViewmodel quizViewmodel = Provider.of<QuizViewmodel>(context);
    Responsiver responsiver = Responsiver(context: context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            RoundedHeader(),
            Container(
              height: responsiver.postAssessmentContainerHeight,
              child: Padding(
                padding: responsiver.postAssessmentOptionsPadding,
                child: Column(
                  children: [
                    Spacer(),
                    ICPostAsessmentsOptions(),
                    Spacer(),
                    buildButtons(context, size, quizViewmodel),
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

Row buildButtons(BuildContext context, Size size, QuizViewmodel quizViewmodel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
          child: ICSecondaryButton(
        accentColor: kBlue,
        width: double.infinity,
        onPressed: () {
          Navigator.pushNamed(context, "/quiz-screen");
        },
        text: "Score",
      )),
      SizedBox(
        width: 14,
      ),
      Flexible(
          child: ICMainButton(
              backgroundColor: kBlue,
              width: double.infinity,
              onPressed: () {
                quizViewmodel.resetQuiz();
                Navigator.pushNamed(context, "/");
              },
              text: "Repeat")),
    ],
  );
}
