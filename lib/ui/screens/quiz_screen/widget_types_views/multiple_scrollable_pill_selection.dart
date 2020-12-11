import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/ui/shared/ic_pill_multiple_selection.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class MultipleScrollablePillSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.currentOptions.optionsMap;
      Responsiver responsiver = Responsiver(context: context);

      return Container(
        height: responsiver.insideQuestionContainerHeight,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              for (var entry in optionsMap.entries)
                ICPillMultipleSelection(
                    isNoneSelected: model.isNoneSelected,
                    text: optionsMap[entry.key].text,
                    index: entry.key,
                    isSelected:
                        model.answers.storedAnswers[model.currentQuestion.id] !=
                                null
                            ? model
                                .answers
                                .storedAnswers[model.currentQuestion.id]
                                .selectedOptions
                                .contains(entry.key)
                            : false),
            ],
          ),
        ),
      );
    });
  }
}
