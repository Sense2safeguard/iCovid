import 'package:flutter_test/flutter_test.dart';
import 'package:iCovid/core/models/data_structure_models.dart';

import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

void main() {
  // given -> setup | when |  then
  group("#$QuizViewmodel initialization process should:", () {
    QuizViewmodel quizViewmodel;
    int listenerCallCount;
    int questionsCount;

    setUp(() {
      listenerCallCount = 0;
      questionsCount = 0;
      quizViewmodel = QuizViewmodel()
        ..addListener(() {
          listenerCallCount += 1;
        });
    });

    test("notify its listeners", () {
      quizViewmodel.initialize();
      expect(listenerCallCount, 2);
      expect(quizViewmodel.currentQuestion.id, "1");
    });

    test("set proper initial configuration", () {
      quizViewmodel.initialize();
      expect(quizViewmodel.currentQuestion.id, "1");
      expect(quizViewmodel.isOtherVisible, false);
      expect(quizViewmodel.otherValue, null);
      expect(quizViewmodel.selectedOption, null);
      expect(quizViewmodel.hasOther, true);
      expect(quizViewmodel.widgetType, "MultiplePillSelection");
    });

    test("get full $QuestionsModel DB", () {
      quizViewmodel.initialize();
      quizViewmodel.questions.questionsMap.forEach((key, value) {
        questionsCount++;
      });
      expect(questionsCount, 9);
    });
  });

  group("$QuizViewmodel navigation should:", () {
    QuizViewmodel quizViewmodel;
    int listenerCallCount;

    setUp(() {
      listenerCallCount = 0;
      quizViewmodel = QuizViewmodel.forTesting()
        ..addListener(() {
          listenerCallCount += 1;
        });
    });

    group("resume if is not first time. Doing so, it should: ", () {
      test("", () {});
      test("", () {});
    });

    group("advance threw the quiz. Doing so, it should: ", () {
      test("select next widget to show", () {});
      test("select next question to show", () {});
      test("update with notifiers the screen", () {});
      test("store them in a shared pref local db", () {});
    });

    group("storing answers. Doing so, it should: ", () {
      test("save all the user answers", () {});
      test("if none is selected, blank previous selected options", () {});
    });

    group("move back threw the quiz. Doing so, it should:", () {
      test("get last visited question", () {
        quizViewmodel.navigateBack();
        expect(quizViewmodel.questionOrder, "2");
      });

      test("check if other field should be visible", () {
        quizViewmodel.navigateBack();
        quizViewmodel.navigateBack();
        expect(quizViewmodel.isOtherVisible, true);
      });

      test("jump to the correct next", () {
        quizViewmodel.navigateBack();
        quizViewmodel.navigateBack();
        quizViewmodel.navigateNext();
        expect(quizViewmodel.currentQuestion.id, "2");
      });

      test("if first, back button disabled", () {});

      test("if no stored answers, next button disabled", () {});

      // TODO: better supply a #widget_test
      test("populate other field if visible", () {
        quizViewmodel.navigateBack();
        quizViewmodel.navigateBack();

        expect(quizViewmodel.otherValue, "Other value");
      });

      // TODO: better supply a #widget_test
      test("checked selected options", () {});

      test("notify its listeners", () {
        quizViewmodel.navigateBack();
        expect(listenerCallCount, 1);
      });
    });
  });
}
