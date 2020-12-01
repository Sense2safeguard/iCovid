import 'package:flutter/material.dart';
import 'package:iCovid/core/helpers/check_progress_helper.dart';

import 'package:provider/provider.dart';

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

    print('Quiz Screen painted');

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: ListView(
          children: [
            ICAppBar(
              question: model.currentQuestion,
            ),
            SizedBox(height: 34),
            buildBody(size, model.currentQuestion, model)
          ],
        ),
      ),
    );
  }

  Padding buildBody(Size size, Question question, QuizViewmodel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          buildTitleArea(question.category, model),
          SizedBox(height: 26),
          ICQuestion(size: size)
        ],
      ),
    );
  }

  Column buildTitleArea(String category, QuizViewmodel model) {
    return Column(
      children: [
        Text(
          // question.category,
          category,
          style: kheadline4.copyWith(color: Colors.white),
        ),
        SizedBox(height: 20),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("${(checkProgress(model) * 100).toInt()} % to complete",
                style: kOverlineTextStyle)),
        SizedBox(height: 10),
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
