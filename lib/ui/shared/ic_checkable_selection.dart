import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICCheckableSelection extends StatelessWidget {
  final String label;
  final String groupValue;
  final String index;
  final Function onChanged;
  final bool hasOther;
  final String widgetType;

  const ICCheckableSelection({
    this.label,
    this.groupValue,
    this.index,
    this.onChanged,
    this.hasOther,
    this.widgetType,
  });

  @override
  Widget build(BuildContext context) {
    bool _isSelected = index == groupValue;
    return Column(
      children: [
        Container(
          height: 48,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: _isSelected ? kNeoAccent : Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                if (_isSelected)
                  BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      color: kCoolGrey.withOpacity(0.4))
              ],
              border: Border.all(
                  color: _isSelected ? Colors.transparent : kCoolGrey)),
          child: InkWell(
              onTap: () {
                if (!_isSelected) onChanged(label, index, widgetType, hasOther);
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      if (_isSelected)
                        Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: kAccent, shape: BoxShape.circle),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(label,
                          style: _isSelected
                              ? kCheckedSelectionSelected
                              : kCheckedSelectionUnSelected)
                    ],
                  ))),
        ),
        SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
