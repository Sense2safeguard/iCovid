import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICRadioSelection extends StatefulWidget {
  final String text;
  final String index;
  final Function onChanged;
  final String widgetType;
  final bool hasOther;

  const ICRadioSelection({
    this.text,
    this.onChanged,
    this.index,
    this.widgetType,
    this.hasOther,
  });

  @override
  _ICRadioSelectionState createState() => _ICRadioSelectionState();
}

class _ICRadioSelectionState extends State<ICRadioSelection> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
                setState(() {
                  _isSelected = !_isSelected;
                });
                widget.onChanged(widget.text, widget.index, widget.widgetType,
                    widget.hasOther);
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
                      Text(widget.text,
                          style: _isSelected
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
