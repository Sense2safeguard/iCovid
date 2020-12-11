import 'package:flutter/material.dart';
import 'package:iCovid/core/services/shared_preferences_service.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';
import 'package:iCovid/ui/shared/ic_multiline_input.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_radio_selection_post_assessment%20.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/post_assessment_viewmodel.dart';
import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/constants.dart';

class ICPostAsessmentsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Responsiver responsiver = Responsiver(context: context);

    return Consumer<PostAssessmentViewmodel>(
      builder: (context, model, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(model.isSentTestScreen ? model.titles[0] : model.titles[1],
                textAlign: TextAlign.center,
                style: responsiver.isBig
                    ? kBodyText2.copyWith(color: kBlue)
                    : kBodyText2small.copyWith(color: kBlue)),
            SizedBox(
              height: responsiver.smallVertical,
            ),
            // test screen
            if (model.isSentTestScreen)
              for (var option in model.options)
                ICRadioSelectionPostAssessment(
                  key: Key(option.id),
                  text: option.text,
                  index: option.id,
                  isPreviouslySelected: false,
                  width: size.width * 0.6,
                ),
            // obervations screen
            if (!model.isSentTestScreen) ICPossAssessmentTextField(size: size),
            if (model.isSentTestScreen)
              SizedBox(
                height: responsiver.smallVertical,
              ),
            ICMainButton(
                isDisabled: model.isDisabled,
                width: double.infinity,
                onPressed: () {
                  if (model.isSentTestScreen) {
                    UserPreferences().setSelectedOptions(model.selectedOption);
                    model.toggleIsDisabled();
                    model.sendTestResults();
                  } else {
                    UserPreferences().setSelectedOptions(model.selectedOption);
                    model.toggleIsDisabled();
                    model.areObservationsSentToTrue();
                  }
                },
                text: model.isSentTestScreen
                    ? "Send your Test result"
                    : model.areObservationsSent
                        ? "Sent successfully!"
                        : "Send observations")
          ],
        );
      },
    );
  }
}
