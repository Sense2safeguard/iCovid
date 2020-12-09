import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_other_input.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/shared/ic_checkable_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class SingleCheckableSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.currentOptions.optionsMap;
      double buttonHeight = size.height * 0.063;
      double extraSpace = size.height * 0.05;

      return Container(
        // decide height in order to keep them always in the center
        height: model.isOtherVisible
            ? (buttonHeight * (optionsMap.length + 1.5)) + extraSpace
            : (buttonHeight * optionsMap.length) + extraSpace,
        child: Column(
          children: [
            for (var entry in optionsMap.entries)
              ICCheckableSelection(
                  text: optionsMap[entry.key].text,
                  index: entry.key,
                  isPreviouslySelected:
                      model.answers.storedAnswers[model.currentQuestion.id] !=
                                  null &&
                              model.selectedOption == null
                          ? model
                              .answers
                              .storedAnswers[model.currentQuestion.id]
                              .selectedOptions
                              .contains(entry.key)
                          : false),
            if (model.isOtherVisible)
              ICOtherInput(
                  key: Key(model.currentQuestion.id),
                  previousValue: model.answers
                      .storedAnswers[model.currentQuestion.id].otherValue,
                  updateOtherValue: model.updateOtherValue),
          ],
        ),
      );
    });
  }
}
