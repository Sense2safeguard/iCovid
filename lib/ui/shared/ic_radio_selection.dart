import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICRadioSelection extends StatelessWidget {
  final String text;
  final String index;
  final bool isPreviouslySelected;

  ICRadioSelection({
    this.index,
    this.text,
    this.isPreviouslySelected,
  });

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    Size size = MediaQuery.of(context).size;
    Responsiver responsiver = Responsiver(context: context);

    bool _isSelected =
        isPreviouslySelected ? true : index == model.selectedOption;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: responsiver.icRadioSelectionHeight,
          width: responsiver.icRadioSelectionWidth,
          margin: EdgeInsets.symmetric(vertical: 4),
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
                  model.storeAnswers(index);
                  model.otherVisible(text);
                  model.selectNext(index);
                  model.amISelected(text, index);
                  model.calculateNextDisabled();
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
                              width: size.width * 0.04,
                              height: size.width * 0.04,
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
                        width: responsiver.smallestHorizontal,
                      ),
                      Text(text,
                          style: _isSelected
                              ? kPillSelectedTextStyle.copyWith(color: kBlue)
                              : kPillUnselectedTextStyle)
                    ],
                  ))),
        ),
        SizedBox(width: size.width * 0.015),
      ],
    );
  }
}
