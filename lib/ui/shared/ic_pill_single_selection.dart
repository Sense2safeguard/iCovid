import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICPillSingleSelection extends StatelessWidget {
  final String label;
  final String groupValue;
  final String index;
  final Function onChanged;
  final bool hasOther;
  final String widgetType;

  ICPillSingleSelection({
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
                  if (!_isSelected)
                    onChanged(label, index, widgetType, hasOther);
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
                        Text(label,
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
