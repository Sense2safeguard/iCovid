import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/db_service.dart';

class DBServiceMocked implements DBService {
  Map<String, dynamic> jsonResponse = {
    "questions": {
      "1": {
        "id": "1",
        "text": "Do you smoke?",
        "category": "Demographics",
        "widgetType": "SingleCheckableSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "2"},
          "2": {"id": "2", "text": "No", "next": "4"},
        }
      },
      "2": {
        "id": "2",
        "text": "At what age did you start smoking?",
        "category": "Demographics",
        "widgetType": "DialSelection",
        "hasFreeText": "false",
        "next": "3",
        "options": {}
      },
      "3": {
        "id": "3",
        "text": "Does anyone you live with, smoke?",
        "category": "Demographics",
        "widgetType": "SingleCheckableSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "4"},
          "2": {"id": "2", "text": "No", "next": "4"},
        }
      },
      "4": {
        "id": "4",
        "text": "Do you regularly take any medication?",
        "category": "Co-morbidities",
        "widgetType": "SingleCheckableSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "5"},
          "2": {"id": "2", "text": "No", "next": "5"},
        }
      },
    }
  };

  @override
  QuestionsModel getDB() {
    return QuestionsModel.fromJson(jsonResponse);
  }
}
