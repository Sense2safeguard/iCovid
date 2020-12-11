import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/shared/ic_radio_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class SingleRadioSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.currentOptions.optionsMap;
      Responsiver responsiver = Responsiver(context: context);

      return Container(
        height: responsiver.insideQuestionContainerHeight,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3,
          children: [
            for (var entry in optionsMap.entries)
              ICRadioSelection(
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
          ],
        ),
      );
    });
  }
}
