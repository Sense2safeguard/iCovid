import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:iCovid/ui/screens/home_screen/home_screen.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_screen.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

void main() {
  runApp(ICovidApp());
}

class ICovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuizViewmodel(),
        builder: (context, _) {
          return MaterialApp(
              title: "iCovid App",
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => HomeScreen(),
                '/quiz_screen': (context) => QuizScreen(),
              });
        });
  }
}
