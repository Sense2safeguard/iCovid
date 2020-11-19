import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_pill_single_selection.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class SingleScrollablePillSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (_, model, __) {
      Map<String, Option> optionsMap = model.options.optionsMap;
      return Container(
        // TODO: review fixed height
        height: 380,
        child: ListView(
          children: [
            for (var entry in optionsMap.entries)
              ICPillSingleSelection(
                  label: optionsMap[entry.key].text,
                  index: entry.key,
                  groupValue: model.selectedOption,
                  hasOther: model.currentQuestion.hasOther,
                  widgetType: model.currentQuestion.widgetType,
                  onChanged: (String label, String index, String widgetType,
                      bool hasOther) {
                    model.setAndStoreOption(label, index, widgetType, hasOther);
                  }),
          ],
        ),
      );
    });
  }
}