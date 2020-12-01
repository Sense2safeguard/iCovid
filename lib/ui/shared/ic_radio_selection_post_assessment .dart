import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICRadioSelectionPostAssessment extends StatelessWidget {
  final Key key;
  final String text;
  final String index;
  final bool isPreviouslySelected;
  final double width;

  ICRadioSelectionPostAssessment({
    this.index,
    this.text,
    this.isPreviouslySelected,
    this.width,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

    bool _isSelected =
        isPreviouslySelected ? true : index == model.selectedOption;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 32,
          width: width ?? 122,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                if (_isSelected)
                  BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      color: kCoolGrey.withOpacity(0.4))
              ],
              border: Border.all(color: _isSelected ? kBlue : kCoolGrey)),
          child: InkWell(
              onTap: () {
                if (!_isSelected) {
                  model.updateTestOption(index);
                  model.storeTestResult(text);
                }
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: _isSelected ? kBlue : kCoolGrey)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _isSelected ? kBlue : Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  if (_isSelected)
                                    BoxShadow(
                                        offset: Offset(0, 8),
                                        blurRadius: 10,
                                        color: kCoolGrey.withOpacity(0.4))
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(text,
                          style: _isSelected
                              ? kPillSelectedTextStyle.copyWith(color: kBlue)
                              : kPillUnselectedTextStyle)
                    ],
                  ))),
        ),
        SizedBox(width: 6),
      ],
    );
  }
}
