import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/db_service.dart';

class DBServiceMocked implements DBService {
  Map<String, dynamic> jsonResponse = {
    "questions": {
      "1": {
        "id": "1",
        "text": "Do you have any of the following health conditions?",
        "category": "Co-morbidities",
        "widgetType": "MultiplePillsSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Allergies", "next": "2"},
          "2": {"id": "2", "text": "Heart Attack", "next": "2"},
          "3": {"id": "3", "text": "Angina", "next": "2"},
          "4": {"id": "4", "text": "Heart Failure", "next": "2"},
          "5": {"id": "5", "text": "Hight bloog pressure", "next": "2"},
          "6": {"id": "6", "text": "COPD", "next": "2"},
          "7": {"id": "7", "text": "Diabetes", "next": "2"},
          "8": {"id": "8", "text": "Cancer", "next": "2"},
          "9": {"id": "9", "text": "Immunodeficiency", "next": "2"},
          "10": {"id": "10", "text": "Depression", "next": "2"},
          "11": {"id": "11", "text": "Other", "next": "2"},
        }
      },
      "2": {
        "id": "2",
        "text": "Do you smoke?",
        "category": "Demographics",
        "widgetType": "SingleCheckableSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "3"},
          "2": {"id": "2", "text": "No", "next": "5"},
        }
      },
      "3": {
        "id": "3",
        "text": "At what age did you start smoking?",
        "category": "Demographics",
        "widgetType": "DialSelection",
        "hasFreeText": "false",
        "next": "3",
        "options": {
          "1": {"id": "1", "text": "Age", "next": "3"},
        }
      },
      "4": {
        "id": "4",
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
      "5": {
        "id": "5",
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
