import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';

class ICCheckableSelection extends StatelessWidget {
  const ICCheckableSelection({
    this.label,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final int groupValue;
  final int value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    bool _isSelected = value == groupValue;
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
                if (!_isSelected) onChanged(value);
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
