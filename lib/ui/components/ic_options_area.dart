import 'package:flutter/material.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_checked_selection.dart';

class ICOptionsArea extends StatefulWidget {
  // final QuestionModel question;
  // const ICOptionsArea({Key key, this.question}) : super(key: key);

  @override
  _ICOptionsAreaState createState() => _ICOptionsAreaState();
}

class _ICOptionsAreaState extends State<ICOptionsArea> {
  String _widgetType;

  @override
  void initState() {
    super.initState();
    _widgetType = "SingleCheckedSelection";
  }

  @override
  Widget build(BuildContext context) {
    switch (_widgetType) {
      case "SingleCheckedSelection":
        return SingleCheckedSelection();
        break;
      default:
        return Container();
    }
  }
}
