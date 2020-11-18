import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_pill_selection.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class MultiplePillSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.options.optionsMap;
      return Wrap(
        children: [
          for (var entry in optionsMap.entries)
            ICPillSelection(
                text: optionsMap[entry.key].text,
                index: entry.key,
                widgetType: model.currentQuestion.widgetType,
                hasOther: model.currentQuestion.hasOther,
                onChanged: model.setAndStoreOption),
        ],
      );
    });
  }
}
