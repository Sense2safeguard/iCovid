import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/shared/ic_checkable_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class SingleScrollableSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.currentOptions.optionsMap;
      return Container(
        height: 380,
        child: ListView(
          children: [
            for (var entry in optionsMap.entries)
              ICCheckableSelection(
                isPreviouslySelected:
                    model.answers.storedAnswers[model.currentQuestion.id] !=
                                null &&
                            model.selectedOption == null
                        ? model.answers.storedAnswers[model.currentQuestion.id]
                            .selectedOptions
                            .contains(entry.key)
                        : false,
                text: optionsMap[entry.key].text,
                index: entry.key,
              ),
          ],
        ),
      );
    });
  }
}
