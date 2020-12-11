import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:provider/provider.dart';

class ICPillMultipleSelection extends StatefulWidget {
  final String text;
  final String index;
  final bool isSelected;
  final bool isNoneSelected;

  const ICPillMultipleSelection({
    Key key,
    this.text,
    this.index,
    this.isSelected,
    this.isNoneSelected,
  }) : super(key: key);

  @override
  _ICPillMultipleSelectionState createState() =>
      _ICPillMultipleSelectionState();
}

class _ICPillMultipleSelectionState extends State<ICPillMultipleSelection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    Responsiver responsiver = Responsiver(context: context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: size.height * 0.042,
          margin: EdgeInsets.symmetric(
              vertical: size.height * 0.005, horizontal: size.width * 0.01),
          decoration: BoxDecoration(
            color: widget.isSelected ? kBlue : kPaleBlue.withOpacity(0.35),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              if (widget.isSelected)
                BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 10,
                    color: kCoolGrey.withOpacity(0.4))
            ],
          ),
          child: InkWell(
              onTap: () {
                model.toggleNoneSelected(widget.text);
                model.storeAnswers(widget.index, widget.text);
                model.otherVisible(widget.text);
                model.selectNext(widget.index);
                model.calculateNextDisabled();
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.isSelected)
                          Container(
                              width: size.width * 0.05,
                              height: size.width * 0.05,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: size.width * 0.03,
                              )),
                        if (widget.isSelected)
                          SizedBox(
                            width: responsiver.smallestHorizontal,
                          ),
                        Text(widget.text,
                            style: widget.isSelected
                                ? kPillSelectedTextStyle
                                : kPillUnselectedTextStyle)
                      ],
                    ),
                  ))),
        ),
        SizedBox(
          height: responsiver.smallestVertical,
        ),
      ],
    );
  }
}
