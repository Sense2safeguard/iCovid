import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICPillSingleSelection extends StatelessWidget {
  final String text;
  final String index;

  ICPillSingleSelection({
    this.index,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

    bool _isSelected = index == model.selectedOption;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            height: 32,
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: _isSelected ? kBlue : kPaleBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                if (_isSelected)
                  BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      color: kCoolGrey.withOpacity(0.4))
              ],
            ),
            child: InkWell(
                onTap: () {
                  if (!_isSelected) {
                    model.storeAnswers(index);
                    model.otherVisible(text);
                    model.selectNext(index);
                  }
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_isSelected)
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
                        if (_isSelected)
                          SizedBox(
                            width: 10,
                          ),
                        Text(text,
                            style: _isSelected
                                ? kPillSelectedTextStyle
                                : kPillUnselectedTextStyle)
                      ],
                    ))),
          ),
        ),
        SizedBox(width: 6),
      ],
    );
  }
}
