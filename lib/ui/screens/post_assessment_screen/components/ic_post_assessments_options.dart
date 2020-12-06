import 'package:flutter/material.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';
import 'package:iCovid/ui/shared/ic_multiline_input.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/shared/ic_radio_selection_post_assessment%20.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/widget_types_views/post_assessment_viewmodel.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';
import 'package:iCovid/core/constants.dart';

class ICPostAsessmentsOptions extends StatelessWidget {
  final Size size;

  const ICPostAsessmentsOptions({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostAssessmentViewmodel>(
      builder: (context, model, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(model.isSentTestScreen ? model.titles[0] : model.titles[1],
                textAlign: TextAlign.center,
                style: kBodyText2.copyWith(color: kBlue)),
            mediumSizedBoxVertical(
              currentDeviceSize: size,
            ),
            if (model.isSentTestScreen)
              for (var option in model.options)
                ICRadioSelectionPostAssessment(
                  key: Key(option.id),
                  text: option.text,
                  index: option.id,
                  isPreviouslySelected: false,
                  width: size.width * 0.6,
                ),
            if (!model.isSentTestScreen) ICPossAssessmentTextField(size: size),
            if (model.isSentTestScreen)
              mediumSizedBoxVertical(
                currentDeviceSize: size,
              ),

            // TODO: fix same situation in quiz question
            ICMainButton(
                isDisabled: model.isDisabled,
                width: double.infinity,
                onPressed: () {
                  if (model.isSentTestScreen) {
                    model.toggleIsDisabled();
                    model.sendTestResults();
                  } else {
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
