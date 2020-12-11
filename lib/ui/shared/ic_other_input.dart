import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:provider/provider.dart';

class ICOtherInput extends StatefulWidget {
  final Function updateOtherValue;
  final String previousValue;

  const ICOtherInput({Key key, this.updateOtherValue, this.previousValue})
      : super(key: key);
  @override
  _ICOtherInputState createState() => _ICOtherInputState();
}

class _ICOtherInputState extends State<ICOtherInput> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text =
        widget.previousValue != null ? widget.previousValue : null;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        child: TextField(
          onChanged: (value) =>
              model.updateOtherValue(textController.text.toString()),
          onSubmitted: (value) {
            if (value == "") return null;
            model.saveOtherValue();
            model.calculateNextDisabled();
          },
          autofocus: true,
          controller: textController,
          style: kHintTextStyle.copyWith(color: kBlue),
          decoration: InputDecoration(
              hintText: "Please, write here",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintStyle: kHintTextStyle,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: kBlue)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBlue),
                  borderRadius: BorderRadius.circular(8))),
        ),
      ),
    );
  }
}
