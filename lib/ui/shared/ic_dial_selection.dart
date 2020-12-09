import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/helpers/regex_helper.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICDialSelection extends StatefulWidget {
  final String text;
  final QuizViewmodel model;

  const ICDialSelection({
    Key key,
    this.text,
    this.model,
  }) : super(key: key);

  @override
  _ICDialSelectionState createState() => _ICDialSelectionState();
}

class _ICDialSelectionState extends State<ICDialSelection> {
  Timer timer;
  int _counter = 0;
  double _doubleCounter = 0;
  TextEditingController _controller = TextEditingController();
  var _controllerCounter;

  @override
  void initState() {
    super.initState();
    if (widget.model.answers.storedAnswers[widget.model.currentQuestion.id]
            .selectedOptions.length >
        0) {
      _controller.text = widget.model.answers
          .storedAnswers[widget.model.currentQuestion.id].selectedOptions[0];
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  dynamic computeControllerText() {
    dynamic doubleOrInt = widget.text == "Feet" ? 0.0 : 0;
    return _controller.text == "" || _controller.text == "${widget.text}"
        ? doubleOrInt
        : widget.text == "Feet"
            ? double.parse(_controller.text)
            : int.parse(_controller.text);
  }

  void increment() {
    _controllerCounter = computeControllerText();
    if (widget.text == "Feet") {
      setState(() {
        _doubleCounter = _controllerCounter;
        _doubleCounter = _doubleCounter + 0.1;
        _controller.text = _doubleCounter.toStringAsFixed(1);
      });
    } else {
      setState(() {
        _counter = _controllerCounter;
        _counter++;
        _controller.text = _counter.toString();
      });
    }

    storeAndCalculateNextDisabled();
  }

  void storeAndCalculateNextDisabled() {
    widget.model.storeAnswers(widget.text == "Feet"
        ? _doubleCounter.toString()
        : _counter.toString());
    widget.model.calculateNextDisabled();
  }

  void decrement() {
    _controllerCounter = computeControllerText();

    if (_controllerCounter > 0) if (widget.text == "Feet") {
      setState(() {
        _doubleCounter = _controllerCounter;
        _doubleCounter = _doubleCounter - 0.1;
        if (_doubleCounter < 1) _doubleCounter = 0;
        _controller.text = _doubleCounter == 0
            ? widget.text
            : _doubleCounter.toStringAsFixed(1);
      });
    } else {
      setState(() {
        _counter = _controllerCounter;
        _counter--;
        if (_counter < 1) _counter = 0;
        _controller.text = _counter == 0 ? widget.text : _counter.toString();
      });
    }

    storeAndCalculateNextDisabled();
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
            GestureDetector(
              onTap: () => decrement(),
              child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(),
                  child: Icon(Icons.remove)),
            ),
            Container(
              width: 110,
              child: TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  onSubmitted: (value) {
                    if (!isNumeric(value)) {
                      _controller.text = widget.text;
                      return;
                    } else {
                      _controllerCounter = computeControllerText();
                      widget.model.storeAnswers(value.toString());
                      widget.model.calculateNextDisabled();
                    }
                  },
                  decoration: InputDecoration(border: InputBorder.none),
                  style: kSecondaryButtonTextStyle.copyWith(
                      color: kDarkBlue, fontSize: 14)),
            ),
            GestureDetector(
              onTap: () => increment(),
              child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(),
                  child: Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
