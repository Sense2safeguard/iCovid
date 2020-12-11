import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/multiple_scrollable_pill_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/score_results.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/date_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_radio_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_scrollable_pill_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_scrollable_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/dial_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_checkable_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/multiple_pill_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/constants.dart';

class ICQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsiver responsiver = Responsiver(context: context);

    return Consumer<QuizViewmodel>(
      builder: (context, model, _) {
        Question _currentQuestion = model.currentQuestion;
        String _widgetType = _currentQuestion.widgetType;

        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: Colors.white,
              width: double.infinity,
              height: responsiver.icQuestionContainerHeight,
              child: Padding(
                padding: responsiver.icQuestionMainBodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _currentQuestion.text,
                        style: responsiver.isBig ? kheadline4 : kheadline4small,
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: buildOptionsArea(_widgetType)),
                      Spacer(),
                      buildButtons(model, _widgetType, context),
                      SizedBox(
                        height: responsiver.smallVertical,
                      ),
                    ]),
              )),
        );
      },
    );
  }

  Widget buildOptionsArea(String widgetType) {
    switch (widgetType) {
      case "SingleCheckableSelection":
        return SingleCheckableSelection();
        break;
      case "DialSelection":
        return DialSelection();
        break;
      case "MultiplePillSelection":
        return MultiplePillSelection();
        break;
      case "MultipleScrollablePillSelection":
        return MultipleScrollablePillSelection();
        break;
      case "SingleScrollableSelection":
        return SingleScrollableSelection();
        break;
      case "SingleScrolabblePillSelection":
        return SingleScrollablePillSelection();
        break;
      case "SingleRadioSelection":
        return SingleRadioSelection();
        break;
      case "ScoreResults":
        return ScoreResults();
        break;
      case "DateSelection":
        return DateSelection();
        break;
      default:
        return Container(
            child: Center(
          child: Text("Oops! Something happened!", style: kheadline4),
        ));
    }
  }

  Row buildButtons(
      QuizViewmodel model, String widgetType, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (int.parse(model.currentQuestion.id) > 1)
          Flexible(
              child: ICSecondaryButton(
            onPressed: () {
              model.navigateBack();
            },
            text: "Back",
          )),
        Expanded(
            child: ICMainButton(
                isDisabled: model.isNextDisabled,
                onPressed: () {
                  if (widgetType == "ScoreResults") {
                    model.stablishScore();
                    Navigator.pushNamed(context, "/post-assessment-screen");
                  } else {
                    model.navigateNext();
                  }
                },
                text: widgetType == "ScoreResults" ? "Finish" : "Next")),
      ],
    );
  }
}
