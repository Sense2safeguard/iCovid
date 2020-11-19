import 'package:flutter/material.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_selection_scrollable.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/dial_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_checkable_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/multiple_pill_selection.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICQuestion extends StatelessWidget {
  final Size size;

  const ICQuestion({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(
      builder: (context, model, _) {
        print("IC Question painted");
        Question _currentQuestion = model.currentQuestion;
        String _widgetType = _currentQuestion.widgetType;

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
                      // TODO: change alignment dependant on _widgetType
                      Text(
                        _currentQuestion.text,
                        style: kheadline4,
                        textAlign: TextAlign.left,
                      ),
                      // SizedBox(height: 32),
                      Spacer(),
                      // TODO: Better semantics
                      // Not semantic as I wish but if not,
                      // the Align should go in each case of the switch
                      Align(
                          alignment: Alignment.center,
                          child: buildOptionsArea(_widgetType)),
                      if (model.isOtherVisible) buildOtherArea(_widgetType),
                      Spacer(),
                      buildButtons(model),
                      SizedBox(height: 16),
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
      // TODO: semantics
      case "DialSelection":
        return Column(children: [
          DialSelection(),
          Text('* Long pressed for big jump!', style: kHintTextStyle)
        ]);
        break;
      case "MultiplePillSelection":
        return MultiplePillSelection();
        break;
      case "SingleSelectionScrollable":
        return SingleSelectionScrollable();
        break;
      default:
        return Container(
            child: Center(
          child: Text("Ops! Something happened!"),
        ));
    }
  }

  Widget buildOtherArea(String widgetType) {
    return Padding(
      padding: widgetType == "MultiplePillSelection"
          ? EdgeInsets.all(10.0)
          : EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        child: TextField(
          style: kHintTextStyle.copyWith(color: kBlue),
          decoration: InputDecoration(
              hintText: "Please, write here",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintStyle: kHintTextStyle,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: kBlue)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBlue),
                  borderRadius: BorderRadius.circular(8))),
        ),
      ),
    );
  }

  Row buildButtons(QuizViewmodel model) {
    return Row(
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
    );
  }
}
