import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';

class ICDialSelection extends StatefulWidget {
  final String text;
  final Function onChanged;

  const ICDialSelection({Key key, this.text, this.onChanged}) : super(key: key);

  @override
  _ICDialSelectionState createState() => _ICDialSelectionState();
}

class _ICDialSelectionState extends State<ICDialSelection> {
  String _textToDisplay;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _textToDisplay = widget.text;
  }

  void increment() {
    setState(() {
      _counter++;
      _textToDisplay = _counter.toString();
    });
    widget.onChanged(widget.text, _counter);
  }

  void decrement() {
    if (_counter > 0)
      setState(() {
        _counter--;
        _textToDisplay = _counter == 0 ? widget.text : _counter.toString();
      });
    widget.onChanged(widget.text, _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: 220,
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kPaleBlue),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
                minWidth: 4,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                onPressed: () => decrement(),
                child: Icon(Icons.remove)),
            Text(_textToDisplay,
                style: kSecondaryButtonTextStyle.copyWith(
                    color: kDarkBlue, fontSize: 14)),
            MaterialButton(
                minWidth: 4,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                onPressed: () => increment(),
                child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
