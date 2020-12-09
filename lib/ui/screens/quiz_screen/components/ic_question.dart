import 'package:flutter/material.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/multiple_scrollable_pill_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/score_results.dart';

import 'package:provider/provider.dart';

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
  final Size size;

  const ICQuestion({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(
      builder: (context, model, _) {
        Question _currentQuestion = model.currentQuestion;
        String _widgetType = _currentQuestion.widgetType;

        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: Colors.white,
              width: double.infinity,
              height: size.height * 0.69,
              child: Padding(
                padding: kQuestionMainBodyPadding(size),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _currentQuestion.text,
                        style: kheadline4,
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      // TODO: Better semantics
                      // Not semantic as I wish but if not,
                      // the Align should go in each case of the switch
                      // I could use Extensions to types
                      Align(
                          alignment: Alignment.center,
                          child: buildOptionsArea(_widgetType)),
                      Spacer(),
                      buildButtons(model, _widgetType, context),
                      smallSizedBoxVertical(currentDeviceSize: size),
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
          child: Text("Ops! Something happened!"),
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
        if (model.isNextDisabled)
          Expanded(child: ICMainButton(isDisabled: true, text: "Next")),
        if (!model.isNextDisabled)
          Expanded(
              child: ICMainButton(
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
