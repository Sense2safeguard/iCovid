import 'package:flutter/material.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:iCovid/ui/shared/ic_bottom_rounded_header.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/shared/ic_radio_selection_post_assessment%20.dart';
import 'package:provider/provider.dart';

class PostAssessmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String questionText =
        'If you have consulted a doctor or performed a Covid-19 test, please share the result with us';

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomRoundedHeader(size: size),
            buildCenter(questionText, context),
            buildButtons(context),
          ],
        ),
      ),
    );
  }

  Container buildCenter(String questionText, BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    List<Option> options = [
      Option(id: "1", text: "Negative Test"),
      Option(id: "2", text: "Positive Test"),
    ];

    bool isDisabled = model.selectedOption == null;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(questionText, style: kBodyText2.copyWith(color: kBlue)),
            SizedBox(
              height: 36,
            ),
            for (var option in options)
              ICRadioSelectionPostAssessment(
                key: Key(option.id),
                text: option.text,
                index: option.id,
                isPreviouslySelected: false,
                width: 230,
              ),
            SizedBox(
              height: 36,
            ),
            isDisabled
                ? ICMainButton(
                    isDisabled: isDisabled,
                    width: double.infinity,
                    text: "Send your Test result")
                : ICMainButton(
                    isDisabled: isDisabled,
                    width: double.infinity,
                    onPressed: () {
                      model.sendTestResults();
                      // Navigator.pushNamed(context, "/");
                    },
                    text: "Send your Test result")
          ],
        ),
      ),
    );
  }

  Padding buildButtons(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: ICSecondaryButton(
            accentColor: kBlue,
            width: 140,
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
                  width: 140,
                  onPressed: () {
                    model.initialize();
                    Navigator.pushNamed(context, "/");
                  },
                  text: "Repeat Quiz")),
        ],
      ),
    );
  }
}
