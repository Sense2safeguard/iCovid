import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:provider/provider.dart';

class ICPillMultipleSelection extends StatefulWidget {
  final String text;
  final String index;
  final bool isPreviouslySelected;
  final bool isNoneSelected;
  final bool isSelected;

  const ICPillMultipleSelection(
      {Key key,
      this.text,
      this.index,
      this.isPreviouslySelected,
      this.isNoneSelected,
      this.isSelected})
      : super(key: key);

  @override
  _ICPillMultipleSelectionState createState() =>
      _ICPillMultipleSelectionState();
}

class _ICPillMultipleSelectionState extends State<ICPillMultipleSelection> {
  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 32,
          margin: EdgeInsets.symmetric(vertical: 4),
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
                model.amISelected(widget.text, widget.index);
                model.otherVisible(widget.text);
                model.selectNext(widget.index);
                model.calculateNextDisabled();
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.isSelected)
                        Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            )),
                      if (widget.isSelected)
                        SizedBox(
                          width: 10,
                        ),
                      Text(widget.text,
                          style: widget.isSelected
                              ? kPillSelectedTextStyle
                              : kPillUnselectedTextStyle)
                    ],
                  ))),
        ),
        SizedBox(width: 6),
      ],
    );
  }
}
