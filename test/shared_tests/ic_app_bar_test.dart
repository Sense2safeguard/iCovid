import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iCovid/ui/screens/home_screen/home_screen.dart';

void main() {
  testWidgets("home screen has a main Title with the text: Why i?",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    final textFinder = find.text("Why i?");

    expect(textFinder, findsOneWidget);
  });

  testWidgets("home screen has 4 texts", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    final textFinder = find.byType(Text);

    expect(textFinder, findsNWidgets(4));
  });
}
