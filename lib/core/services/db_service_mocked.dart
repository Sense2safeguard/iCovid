import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/db_service.dart';

class DBServiceMocked implements DBService {
  Map<String, dynamic> response = {
    "questions": {
      "1": {
        "id": "1",
        "category": "Demographics",
        "widgetType": "SingleCheckedSelection",
        "options": {
          "1": {"id": "1", "text": "Yes", "goTo": "2"},
          "2": {"id": "2", "text": "No", "goTo": "2"},
        }
      }
    }
  };

  // Map<String, QuestionModel> _mockedDB = {
  //   "1": QuestionModel(
  //       category: "Demographics",
  //       widgetType: "SingleCheckedSelection",
  //       options: OptionsModel({"1": Option(text: "Yes", goTo: "2")}))
  // };

  @override
  Map<String, QuestionModel> getDB() {
    // return _mockedDB;
  }
}
