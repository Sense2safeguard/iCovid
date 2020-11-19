import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICRadioSelection extends StatelessWidget {
  final String label;
  final String groupValue;
  final String index;
  final Function onChanged;
  final bool hasOther;
  final String widgetType;

  ICRadioSelection({
    this.onChanged,
    this.index,
    this.widgetType,
    this.hasOther,
    this.label,
    this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    bool _isSelected = index == groupValue;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 32,
          width: 122,
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
                if (!_isSelected) onChanged(label, index, widgetType, hasOther);
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
                      Text(label,
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
