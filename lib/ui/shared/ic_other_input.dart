import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICOtherInput extends StatefulWidget {
  final String widgetType;
  final Function storeOtherValue;
  final String previousValue;

  const ICOtherInput(
      {Key key, this.widgetType, this.storeOtherValue, this.previousValue})
      : super(key: key);
  @override
  _ICOtherInputState createState() => _ICOtherInputState();
}

class _ICOtherInputState extends State<ICOtherInput> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("ic_other)input INIT STATE");
    print("${widget.previousValue}");
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
    print("ic_other_input REBUILD");

    return Padding(
      padding: widget.widgetType == "MultiplePillSelection"
          ? EdgeInsets.all(10.0)
          : EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        child: TextField(
          onChanged: widget.storeOtherValue(textController.text.toString()),
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
