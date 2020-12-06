import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'core/services/auth_firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:iCovid/core/services/shared_preferences_service.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/post_assessment_screen.dart';
import 'package:iCovid/ui/screens/post_assessment_screen/widget_types_views/post_assessment_viewmodel.dart';
import 'package:iCovid/ui/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:iCovid/ui/screens/home_screen/home_screen.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_screen.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().init();
  await Firebase.initializeApp();
  runApp(ICovidApp());
}

class ICovidApp extends StatelessWidget {
  final String userUid = UserPreferences().userUid;
  final bool haveAnswers = UserPreferences().questionOrder != null;

  String getInitialRoute() {
    if (userUid != null && UserPreferences().questionOrder != null)
      return '/quiz_screen';
    if (userUid != null) return '/';
    return '/privacy-policy';
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<QuizViewmodel>(
              create: (context) => QuizViewmodel()),
          ChangeNotifierProvider<PostAssessmentViewmodel>(
              create: (context) => PostAssessmentViewmodel()),
          Provider<AuthFirebaseService>(create: (_) => AuthFirebaseService()),
        ],
        child: MaterialApp(
            title: "iCovid App",
            debugShowCheckedModeBanner: false,
            initialRoute: getInitialRoute(),
            // initialRoute: '/privacy-policy',
            // initialRoute: '/post-assessment-screen',
            routes: {
              '/privacy-policy': (context) => PrivacyPolicyScreen(),
              '/': (context) => HomeScreen(),
              '/quiz_screen': (context) => QuizScreen(),
              '/post-assessment-screen': (context) => PostAssessmentScreen()
            }));
  }
}
