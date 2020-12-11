import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/check_progress_helper.dart';
import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/shared/ic_app_bar.dart';
import 'package:iCovid/ui/screens/quiz_screen/components/ic_question.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    Responsiver responsiver = Responsiver(context: context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: ListView(
          children: [
            ICAppBar(
              question: model.currentQuestion,
            ),
            SizedBox(
              height: responsiver.mediumVertical,
            ),
            buildBody(responsiver, model.currentQuestion, model)
          ],
        ),
      ),
    );
  }

  Padding buildBody(
      Responsiver responsiver, Question question, QuizViewmodel model) {
    return Padding(
      padding: responsiver.quizBodyPadding,
      child: Column(
        children: [
          buildTitleArea(question.category, model, responsiver),
          SizedBox(
            height: responsiver.smallVertical,
          ),
          ICQuestion()
        ],
      ),
    );
  }

  Column buildTitleArea(
      String category, QuizViewmodel model, Responsiver responsiver) {
    return Column(
      children: [
        Text(
          category,
          style: kheadline4.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: responsiver.smallVertical,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("${(checkProgress(model) * 100).toInt()} % to complete",
                style: kOverlineTextStyle)),
        SizedBox(
          height: responsiver.smallestVertical,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: checkProgress(model),
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(kAccent),
          ),
        ),
      ],
    );
  }
}
