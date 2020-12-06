import 'package:flutter/material.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_card.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ScoreResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        ICCard(infectionScore: model.results.infectionScore),
        smallSizedBoxVertical(currentDeviceSize: size),
        ICCard(
          complicationScore: model.results.complicationScore,
        ),
      ],
    );
  }
}
