import 'package:flutter/material.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICCheckableSelection extends StatelessWidget {
  final String text;
  final String index;
  final bool isPreviouslySelected;

  const ICCheckableSelection({
    this.text,
    this.index,
    this.isPreviouslySelected,
  });

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    Size size = MediaQuery.of(context).size;

    bool _isSelected =
        isPreviouslySelected ? true : index == model.selectedOption;
    return Column(
      children: [
        Container(
          height: size.height * 0.063,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.002),
          decoration: BoxDecoration(
              color: _isSelected ? kNeoAccent : Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                if (_isSelected)
                  BoxShadow(
                      offset: Offset(0, size.height * 0.01),
                      blurRadius: 10,
                      color: kCoolGrey.withOpacity(0.4))
              ],
              border: Border.all(
                  color: _isSelected ? Colors.transparent : kCoolGrey)),
          child: InkWell(
              onTap: () {
                if (!_isSelected) {
                  model.storeAnswers(index, text);
                  model.otherVisible(text);
                  model.selectNext(index);
                  model.calculateNextDisabled();
                }
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_isSelected)
                          Container(
                              width: size.width * 0.05,
                              height: size.width * 0.05,
                              decoration: BoxDecoration(
                                  color: kAccent, shape: BoxShape.circle),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: size.width * 0.03,
                              )),
                        smallestSizedBoxHorizontal(
                          currentDeviceSize: size,
                        ),
                        Text(text,
                            style: _isSelected
                                ? kCheckedSelectionSelected
                                : kCheckedSelectionUnSelected)
                      ],
                    ),
                  ))),
        ),
        smallestSizedBoxVertical(
          currentDeviceSize: size,
        ),
      ],
    );
  }
}
