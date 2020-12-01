import 'package:flutter/material.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/post_assessment_screen.dart';
import 'package:iCovid/ui/screens/privacy_policy_screen/privacy_policy_screen.dart';

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
          // used to dismiss keyboard when enter
          return MaterialApp(
              title: "iCovid App",
              debugShowCheckedModeBanner: false,
              initialRoute: '/post-assessment-screen',
              routes: {
                '/privacy-policy': (context) => PrivacyPolicyScreen(),
                '/': (context) => HomeScreen(),
                '/quiz_screen': (context) => QuizScreen(),
                '/post-assessment-screen': (context) => PostAssessmentScreen()
              });
        });
  }
}
