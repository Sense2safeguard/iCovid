import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:provider/provider.dart';

class ICDialSelection extends StatefulWidget {
  final String text;

  const ICDialSelection({
    Key key,
    this.text,
  }) : super(key: key);

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

  void increment(QuizViewmodel model, bool isBigJump) {
    setState(() {
      isBigJump ? _counter += 10 : _counter++;
      _textToDisplay = _counter.toString();
    });
    model.storeAnswers(_counter.toString());
    model.selectNext();
  }

  void decrement(QuizViewmodel model, bool isBigJump) {
    if (_counter > 0)
      setState(() {
        isBigJump ? _counter -= 10 : _counter--;
        _textToDisplay = _counter == 0 ? widget.text : _counter.toString();
      });
    model.storeAnswers(_counter.toString());
    model.selectNext();
  }

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

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
                onPressed: () => decrement(model, false),
                onLongPress: () => decrement(model, true),
                child: Icon(Icons.remove)),
            Text(_textToDisplay,
                style: kSecondaryButtonTextStyle.copyWith(
                    color: kDarkBlue, fontSize: 14)),
            // TODO: input to add directly
            MaterialButton(
                minWidth: 4,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                onPressed: () => increment(model, false),
                onLongPress: () => increment(model, true),
                child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
