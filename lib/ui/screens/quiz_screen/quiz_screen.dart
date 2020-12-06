import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/check_progress_helper.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/shared/ic_app_bar.dart';
import 'package:iCovid/ui/screens/quiz_screen/components/ic_question.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: ListView(
          children: [
            ICAppBar(
              question: model.currentQuestion,
            ),
            mediumSizedBoxVertical(currentDeviceSize: size),
            buildBody(size, model.currentQuestion, model)
          ],
        ),
      ),
    );
  }

  Padding buildBody(Size size, Question question, QuizViewmodel model) {
    return Padding(
      padding: kQuizBodyPadding(size),
      child: Column(
        children: [
          buildTitleArea(question.category, model, size),
          smallSizedBoxVertical(currentDeviceSize: size),
          ICQuestion(size: size)
        ],
      ),
    );
  }

  Column buildTitleArea(String category, QuizViewmodel model, Size size) {
    return Column(
      children: [
        Text(
          // question.category,
          category,
          style: kheadline4.copyWith(color: Colors.white),
        ),
        smallSizedBoxVertical(currentDeviceSize: size),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("${(checkProgress(model) * 100).toInt()} % to complete",
                style: kOverlineTextStyle)),
        smallestSizedBoxVertical(currentDeviceSize: size),
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
