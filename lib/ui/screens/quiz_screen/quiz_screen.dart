import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/components/ic_app_bar.dart';
import 'package:iCovid/ui/components/ic_question.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: Column(
          children: [
            ICAppBar(accentTitle: "iCO", lightBlueTitle: "VID"),
            SizedBox(height: 34),
            buildBody(size)
          ],
        ),
      ),
    );
  }

  Padding buildBody(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          buildTitleArea("Demographics"),
          SizedBox(height: 26),
          ICQuestion(size: size)
        ],
      ),
    );
  }

  Column buildTitleArea(String category) {
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
            child: Text("... % to complete", style: kOverlineTextStyle)),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: 0.3,
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(kAccent),
          ),
        ),
      ],
    );
  }
}