import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_pill_multiple_selection.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class MultipleScrollablePillSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.currentOptions.optionsMap;
      Size size = MediaQuery.of(context).size;

      return Container(
        height: size.height * 0.47,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              for (var entry in optionsMap.entries)
                ICPillMultipleSelection(
                    isNoneSelected: model.isNoneSelected,
                    isSelected: model.amISelected(
                        optionsMap[entry.key].text, entry.key),
                    text: optionsMap[entry.key].text,
                    index: entry.key,
                    isPreviouslySelected:
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
