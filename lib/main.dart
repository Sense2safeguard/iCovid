import 'package:flutter/material.dart';
import 'package:iCovid/ui/screens/home_screen/home_screen.dart';

void main() {
  runApp(ICovidApp());
}

class ICovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "iCovid App",
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
