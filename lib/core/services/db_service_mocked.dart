import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/db_service.dart';

class DBServiceMocked implements DBService {
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
          "2": {"id": "2", "text": "Heart Attack", "next": "2"},
          "3": {"id": "3", "text": "Angina", "next": "2"},
          "4": {"id": "4", "text": "Heart Failure", "next": "2"},
          "5": {"id": "5", "text": "Hight blood pressure", "next": "2"},
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
        "text": "Do you regularly take any medication?",
        "hasOther": "true",
        "category": "Co-morbidities",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "3"},
          "2": {"id": "2", "text": "No", "next": "3"},
        }
      },
      "3": {
        "id": "3",
        "text": "Are you...",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Male", "next": "4"},
          "2": {"id": "2", "text": "Female", "next": "4"},
          "3": {"id": "3", "text": "Other", "next": "4"},
        }
      },
      "4": {
        "id": "4",
        "text": "How old are you?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Age", "next": "5"},
        }
      },
      "5": {
        "id": "5",
        "text": "Where do you live?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "SingleSelectionScrollable",
        "options": {
          "1": {"id": "1", "text": "Åland Islands", "next": "6"},
          "2": {"id": "2", "text": "Albania", "next": "6"},
          "3": {"id": "3", "text": "Algeria", "next": "6"},
          "4": {"id": "4", "text": "American Samoa", "next": "6"},
          "5": {"id": "5", "text": "AndorrA", "next": "6"},
          "6": {"id": "6", "text": "Angola", "next": "6"},
          "7": {"id": "7", "text": "Anguilla", "next": "6"},
          "8": {"id": "8", "text": "Antarctica", "next": "6"},
        }
      },
      "6": {
        "id": "6",
        "text": "Where were you born?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "SingleSelectionScrollable",
        "options": {
          "1": {"id": "1", "text": "Åland Islands", "next": "7"},
          "2": {"id": "2", "text": "Albania", "next": "7"},
          "3": {"id": "3", "text": "Algeria", "next": "7"},
          "4": {"id": "4", "text": "American Samoa", "next": "7"},
          "5": {"id": "5", "text": "AndorrA", "next": "7"},
          "6": {"id": "6", "text": "Angola", "next": "7"},
          "7": {"id": "7", "text": "Anguilla", "next": "7"},
          "8": {"id": "8", "text": "Antarctica", "next": "7"},
        }
      },
      // "2": {
      //   "id": "2",
      //   "text": "Do you smoke?",
      //   "category": "Demographics",
      //   "widgetType": "SingleCheckableSelection",
      //   "hasFreeText": "false",
      //   "next": "",
      //   "options": {
      //     "1": {"id": "1", "text": "Yes", "next": "3"},
      //     "2": {"id": "2", "text": "No", "next": "5"},
      //   }
      // },

      // "4": {
      //   "id": "4",
      //   "text": "Does anyone you live with, smoke?",
      //   "category": "Demographics",
      //   "widgetType": "SingleCheckableSelection",
      //   "hasFreeText": "false",
      //   "next": "",
      //   "options": {
      //     "1": {"id": "1", "text": "Yes", "next": "4"},
      //     "2": {"id": "2", "text": "No", "next": "4"},
      //   }
      // },
      // "5": {
      //   "id": "5",
      //   "text": "Do you regularly take any medication?",
      //   "category": "Co-morbidities",
      //   "widgetType": "SingleCheckableSelection",
      //   "hasFreeText": "false",
      //   "next": "",
      //   "options": {
      //     "1": {"id": "1", "text": "Yes", "next": "5"},
      //     "2": {"id": "2", "text": "No", "next": "5"},
      //   }
      // },
    }
  };

  @override
  QuestionsModel getDB() {
    return QuestionsModel.fromJson(jsonResponse);
  }
}
