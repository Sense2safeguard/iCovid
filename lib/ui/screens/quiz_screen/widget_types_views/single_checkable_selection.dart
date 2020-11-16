import 'package:flutter/material.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/components/ic_checkable_selection.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:provider/provider.dart';

class SingleCheckableSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (context, model, _) {
      Map<String, Option> optionsMap = model.options.optionsMap;
      return Column(
        children: [
          for (String key in optionsMap.keys)
            ICCheckableSelection(
                label: optionsMap[key].text,
                value: int.parse(key),
                groupValue: model.selectedOption,
                onChanged: (int index) {
                  model.setSelectedOption(index);
                }),
        ],
      );
    });
  }
}
