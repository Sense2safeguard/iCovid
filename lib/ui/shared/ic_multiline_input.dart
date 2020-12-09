import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/post_assessment_viewmodel.dart';

class ICPossAssessmentTextField extends StatefulWidget {
  final Size size;

  const ICPossAssessmentTextField({
    Key key,
    @required this.size,
  }) : super(key: key);

  @override
  _ICPossAssessmentTextFieldState createState() =>
      _ICPossAssessmentTextFieldState();
}

class _ICPossAssessmentTextFieldState extends State<ICPossAssessmentTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PostAssessmentViewmodel model =
        Provider.of<PostAssessmentViewmodel>(context);

    return Container(
      height: widget.size.height * 0.18,
      width: double.infinity,
      child: TextField(
        onSubmitted: (value) {
          if (value != null || value != "") {
            textController.text = value;
            model.updateSelectedOptionOrValue(value);
            model.checkisDisabled();
          }
        },
        minLines: 4,
        maxLines: 6,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: textController,
        style: kHintTextStyle.copyWith(color: kBlue),
        decoration: InputDecoration(
            hintText:
                'Please add any observations you or your doctor made you think might be helpful to understand your personal COVID-19 experience.',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintStyle: kHintTextStyle,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: kBlue)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kBlue),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
