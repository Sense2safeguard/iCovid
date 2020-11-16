import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/components/ic_buttons.dart';
import 'package:iCovid/ui/components/ic_options_area.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICQuestion extends StatelessWidget {
  final Size size;

  const ICQuestion({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(
      builder: (context, model, child) {
        print("IC Question painted");
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: Colors.white,
              width: double.infinity,
              height: size.height * 0.67,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.currentQuestion.text,
                        style: kheadline4,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 32),
                      ICOptionsArea(
                        question: model.currentQuestion,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: ICSecondaryButton(
                            onPressed: () {},
                            text: "Back",
                          )),
                          Flexible(
                              child: ICMainButton(
                                  onPressed: () {
                                    model.navigateNext();
                                  },
                                  text: "Next")),
                        ],
                      ),
                      SizedBox(height: 16),
                    ]),
              )),
        );
      },
    );
  }
}
