import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/services/shared_preferences_service.dart';
import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/ui/shared/ic_card.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ScoreResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    UserPreferences().setResultsReceived(true);
    Responsiver responsiver = Responsiver(context: context);

    return Column(
      children: [
        ICCard(infectionScore: model.results.infectionScore),
        SizedBox(
          height: responsiver.smallVertical,
        ),
        ICCard(
          complicationScore: model.results.complicationScore,
        ),
      ],
    );
  }
}
