import 'package:flutter/material.dart';
import 'package:iCovid/ui/shared/ic_radio_selection.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class SingleRadioSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.options.optionsMap;
      return Column(
        children: [
          for (var entry in optionsMap.entries)
            ICRadioSelection(
                text: optionsMap[entry.key].text,
                index: entry.key,
                // groupValue: model.selectedOption,
                hasOther: model.currentQuestion.hasOther,
                widgetType: model.currentQuestion.widgetType,
                onChanged: (String label, String index, String widgetType,
                    bool hasOther) {
                  model.setAndStoreOption(label, index, widgetType, hasOther);
                }),
        ],
      );
    });
  }
}
