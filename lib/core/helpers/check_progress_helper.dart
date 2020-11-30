import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

double checkProgress(QuizViewmodel model) {
  List<String> questionsIds = [];

  model.questions.questionsMap.forEach((key, value) {
    questionsIds.add(key);
  });

  int actualIndex = questionsIds.indexOf(model.currentQuestion.id);

  var a = questionsIds.length;
  var b = 1;
  var c = actualIndex;
  double d = (c * b) / a;

  return d;
}
