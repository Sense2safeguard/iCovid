import 'package:flutter/material.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';

import 'package:provider/provider.dart';

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

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            BottomRoundedHeader(size: size),
            Container(
              height: size.height * 0.69,
              child: Padding(
                padding: kQuestionMainPostAssessmentBodyPadding(size),
                child: Column(
                  children: [
                    Spacer(),
                    ICPostAsessmentsOptions(size: size),
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
    // TODO: repeat with other buttons
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
          child: ICSecondaryButton(
        accentColor: kBlue,
        width: size.width * 0.35,
        onPressed: () {
          Navigator.pop(context);
        },
        text: "View Score",
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
              text: "Repeat All")),
    ],
  );
}
