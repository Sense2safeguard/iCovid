import 'package:iCovid/core/helpers/list_of_countries_helper.dart';
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
          "2": {"id": "2", "text": "Angina", "next": "2"},
          "3": {"id": "3", "text": "Athma", "next": "2"},
          "4": {"id": "4", "text": "COPD", "next": "2"},
          "5": {"id": "5", "text": "Cancer", "next": "2"},
          "6": {"id": "6", "text": "Depression", "next": "2"},
          "7": {"id": "7", "text": "Diabetes", "next": "2"},
          "8": {"id": "8", "text": "Heart Attack", "next": "2"},
          "9": {"id": "9", "text": "Heart Failure", "next": "2"},
          "10": {"id": "10", "text": "Hight blood pressure", "next": "2"},
          "11": {"id": "11", "text": "Immunodeficiency", "next": "2"},
          "12": {"id": "12", "text": "Other", "next": "2"},
          "13": {"id": "13", "text": "None", "next": "2"},
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
        "widgetType": "SingleScrollableSelection",
        "options": {}
      },
      "6": {
        "id": "6",
        "text": "Where were you born?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "SingleScrollableSelection",
        "options": {},
      },
      "7": {
        "id": "7",
        "text": "What is your ethnicity?",
        "hasOther": "true",
        "category": "Demographics",
        "widgetType": "MultipleScrollablePillSelection",
        "options": {
          "1": {"id": "1", "text": "African", "next": "8"},
          "2": {
            "id": "2",
            "text": "American Indian or Alaska Native",
            "next": "8"
          },
          "3": {"id": "3", "text": "African", "next": "8"},
          "4": {
            "id": "4",
            "text": "American Indian or Alaska Native",
            "next": "8"
          },
          "5": {"id": "5", "text": "Any other Asian background", "next": "8"},
          "6": {"id": "6", "text": "Any other mixed background", "next": "8"},
          "7": {"id": "7", "text": "Black or African American", "next": "8"},
          "8": {"id": "8", "text": "British", "next": "8"},
          "9": {"id": "9", "text": "Caribbean", "next": "8"},
          "10": {"id": "10", "text": "Chinese", "next": "8"},
          "11": {"id": "11", "text": "Hispanic (of any race)", "next": "8"},
          "12": {"id": "12", "text": "Indian", "next": "8"},
          "13": {"id": "13", "text": "Irish", "next": "8"},
          "14": {
            "id": "14",
            "text": "Native Hawaiian or Pacific Islander",
            "next": "8"
          },
          "15": {"id": "15", "text": "Pakistani", "next": "8"},
          "16": {"id": "16", "text": "White", "next": "8"},
          "17": {"id": "17", "text": "White and Asian", "next": "8"},
          "18": {"id": "18", "text": "White and Black Caribbean", "next": "8"},
          "19": {"id": "19", "text": "Other", "next": "8"},
        }
      },
      "8": {
        "id": "8",
        "text": "What is your weight?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "pounds", "next": "9"},
        }
      },
      "9": {
        "id": "9",
        "text": "What is your height?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "centimeters", "next": "10"},
        }
      },
      "10": {
        "id": "10",
        "text": "Do you smoke?",
        "category": "Demographics",
        "widgetType": "SingleCheckableSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "11"},
          "2": {"id": "2", "text": "No", "next": "12"},
        }
      },
      "11": {
        "id": "11",
        "text": "When did you start smoking?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Age", "next": "12"},
        }
      },
      "12": {
        "id": "12",
        "text": "Does anyone you live with, smoke?",
        "category": "Demographics",
        "widgetType": "SingleCheckableSelection",
        "hasFreeText": "false",
        "next": "",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "13"},
          "2": {"id": "2", "text": "No", "next": "13"},
        }
      },
      "13": {
        "id": "13",
        "text": "What blood type are you?",
        "hasOther": "false",
        "category": "Demographics",
        "widgetType": "SingleRadioSelection",
        "options": {
          "1": {"id": "1", "text": "A +", "next": "14"},
          "2": {"id": "2", "text": "A -", "next": "14"},
          "3": {"id": "3", "text": "B +", "next": "14"},
          "4": {"id": "4", "text": "B -", "next": "14"},
          "5": {"id": "5", "text": "AB +", "next": "14"},
          "6": {"id": "6", "text": "AB -", "next": "14"},
          "7": {"id": "7", "text": "0 +", "next": "14"},
          "8": {"id": "8", "text": "0 -", "next": "14"},
          "9": {"id": "9", "text": "Don't know", "next": "14"},
        }
      },
      "14": {
        "id": "14",
        "text": "Do you have any symptoms?",
        "hasOther": "false",
        "category": "Viral",
        "widgetType": "MultiplePillSelection",
        "options": {
          "1": {"id": "1", "text": "Body aches", "next": "15"},
          "2": {"id": "2", "text": "Chest pain", "next": "15"},
          "3": {"id": "3", "text": "Cough", "next": "15"},
          "4": {"id": "4", "text": "Diarrhea", "next": "15"},
          "5": {"id": "5", "text": "Fatigue", "next": "15"},
          "6": {"id": "6", "text": "Fever", "next": "15"},
          "7": {"id": "7", "text": "Headache", "next": "15"},
          "8": {"id": "8", "text": "Loss of sense of smell", "next": "15"},
          "9": {"id": "9", "text": "Loss of sense of taste", "next": "15"},
          "10": {"id": "10", "text": "Nausea", "next": "15"},
          "11": {"id": "11", "text": "New rash on body", "next": "15"},
          "12": {"id": "12", "text": "Runny Nose", "next": "15"},
          "13": {"id": "13", "text": "Scratchy throat", "next": "15"},
          "14": {"id": "14", "text": "Sneeze", "next": "15"},
          "15": {"id": "15", "text": "None", "next": "15"},
        }
      },
      "15": {
        "id": "15",
        "text": "Did you travel in the last month?",
        "hasOther": "false",
        "category": "International",
        "widgetType": "SingleCheckableSelection",
        "options": {
          // TODO: correct this and all the next to 16 ...
          "1": {"id": "1", "text": "Yes", "next": "17"},
          "2": {"id": "2", "text": "No", "next": "19"},
        }
      },
      "17": {
        "id": "17",
        "text": "Destination?",
        "hasOther": "false",
        "category": "International",
        "widgetType": "SingleScrollableSelection",
        "options": {
          "1": {"id": "1", "text": "Åland Islands", "next": "18"},
          "2": {"id": "2", "text": "Albania", "next": "18"},
          "3": {"id": "3", "text": "Algeria", "next": "18"},
          "4": {"id": "4", "text": "American Samoa", "next": "18"},
          "5": {"id": "5", "text": "AndorrA", "next": "18"},
          "6": {"id": "6", "text": "Angola", "next": "18"},
          "7": {"id": "7", "text": "Anguilla", "next": "18"},
          "8": {"id": "8", "text": "Antarctica", "next": "18"},
        }
      },
      "18": {
        "id": "18",
        "text": "Type of travel?",
        "hasOther": "true",
        "category": "International",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Ski resort", "next": "19"},
          "2": {"id": "2", "text": "Beach", "next": "19"},
        }
      },
      "19": {
        "id": "19",
        "text": "Do you wear a mask?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "20"},
          "2": {"id": "2", "text": "No", "next": "20"},
        }
      },
      "20": {
        "id": "20",
        "text": "Do you work from home?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "22"},
          "2": {"id": "2", "text": "Sometimes", "next": "21"},
          "3": {"id": "2", "text": "Most of the time", "next": "21"},
        }
      },
      "21": {
        "id": "21",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "22"},
        }
      },
      "22": {
        "id": "22",
        "text": "Do you eat out in restaurants?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "30"},
          "2": {"id": "2", "text": "Sometimes", "next": "23"},
          "3": {"id": "2", "text": "Most of the time", "next": "23"},
        }
      },
      "23": {
        "id": "23",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "24"},
        }
      },
      "24": {
        "id": "24",
        "text": "Do you eat inside?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "26"},
          "2": {"id": "2", "text": "Sometimes", "next": "25"},
          "3": {"id": "2", "text": "Most of the time", "next": "25"},
        }
      },
      "25": {
        "id": "25",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "24"},
        }
      },
      "26": {
        "id": "26",
        "text": "Do you eat outside?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "28"},
          "2": {"id": "2", "text": "Sometimes", "next": "27"},
          "3": {"id": "2", "text": "Most of the time", "next": "27"},
        }
      },
      "27": {
        "id": "27",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "28"},
        }
      },
      "28": {
        "id": "28",
        "text": "Do you take out?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "30"},
          "2": {"id": "2", "text": "Sometimes", "next": "29"},
          "3": {"id": "2", "text": "Most of the time", "next": "29"},
        }
      },
      "29": {
        "id": "29",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "30"},
        }
      },
      "30": {
        "id": "28",
        "text": "Do you go to church?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "32"},
          "2": {"id": "2", "text": "Sometimes", "next": "31"},
          "3": {"id": "2", "text": "Most of the time", "next": "31"},
        }
      },
      "31": {
        "id": "29",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "32"},
        }
      },
      "32": {
        "id": "32",
        "text": "Are you religious?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "MultiplePillSelection",
        "options": {
          "1": {"id": "1", "text": "Buddhism", "next": "33"},
          "2": {"id": "2", "text": "Christianity", "next": "33"},
          "3": {"id": "3", "text": "Daoism", "next": "33"},
          "4": {"id": "4", "text": "Hinduism", "next": "33"},
          "5": {"id": "5", "text": "Islam", "next": "33"},
          "6": {"id": "6", "text": "Judaism", "next": "33"},
          "7": {"id": "7", "text": "Other", "next": "33"},
        },
      },
      "33": {
        "id": "33",
        "text": "Do you go to parties?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "35"},
          "2": {"id": "2", "text": "Sometimes", "next": "34"},
          "3": {"id": "2", "text": "Most of the time", "next": "34"},
        }
      },
      "34": {
        "id": "34",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "35"},
        }
      },
      "35": {
        "id": "35",
        "text": "Do you go to gym?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "37"},
          "2": {"id": "2", "text": "Sometimes", "next": "36"},
          "3": {"id": "2", "text": "Most of the time", "next": "36"},
        }
      },
      "36": {
        "id": "36",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "37"},
        }
      },
      "37": {
        "id": "37",
        "text": "Do you use public transportation?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Never", "next": "39"},
          "2": {"id": "2", "text": "Sometimes", "next": "38"},
          "3": {"id": "2", "text": "Most of the time", "next": "38"},
        }
      },
      "38": {
        "id": "38",
        "text": "How many times last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "39"},
        }
      },
      "39": {
        "id": "39",
        "text": "Have you tested positive for COVID-19 in at least one test?",
        "hasOther": "true",
        "category": "Social Distancing",
        "widgetType": "SingleCheckableSelection",
        "options": {
          "1": {"id": "1", "text": "Yes", "next": "40"},
          "2": {"id": "2", "text": "No", "next": "41"},
        }
      },
      "40": {
        "id": "40",
        "text": "How many weeks last week?",
        "hasOther": "false",
        "category": "Social Distancing",
        "widgetType": "DialSelection",
        "options": {
          "1": {"id": "1", "text": "Times", "next": "41"},
        }
      },
    }
  };

  @override
  QuestionsModel getDB() {
    jsonResponse["questions"]["5"]["options"] = countriesToString("6");
    jsonResponse["questions"]["6"]["options"] = countriesToString("7");
    return QuestionsModel.fromJson(jsonResponse);
  }
}
