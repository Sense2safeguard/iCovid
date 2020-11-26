import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_dial_selection.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class DialSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewmodel>(builder: (context, model, _) {
      Map<String, Option> optionsMap = model.currentOptions.optionsMap;
      return Column(
        children: [
          for (var entry in optionsMap.entries)
            ICDialSelection(
              text: optionsMap[entry.key].text,
            ),
        ],
      );
    });
  }
}
