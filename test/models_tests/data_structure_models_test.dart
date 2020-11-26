import 'package:flutter_test/flutter_test.dart';
import 'package:iCovid/core/models/data_structure_models.dart';

void main() {
  // given -> setup | when |  then
  group("DataStructure models should:", () {
    QuestionsModel questions;
    test("parse a Json into a $QuestionsModel", () {
      Map<String, dynamic> jsonResponse = {
        "questions": {
          "1": {
            "id": "1",
            "text": "Do you have any of the following health conditions?",
            "hasOther": "true",
            "category": "Co-morbidities",
            "widgetType": "MultiplePillSelection",
            "options": {
              "1": {"id": "1", "text": "Allergies", "next": "2"},
            }
          }
        }
      };

      questions = QuestionsModel.fromJson(jsonResponse);

      expect(questions.questionsMap["1"].options.optionsMap["1"].text,
          "Allergies");
    });

    test("generate a correct empty $Answer with empty selectedOptions", () {
      Answer emptyAnswer = Answer.empty("1");
      expect(emptyAnswer.selectedOptions, []);
    });
  });
}
