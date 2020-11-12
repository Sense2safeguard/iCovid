import 'package:iCovid/core/models/data_structure_models.dart';

abstract class DBService {
  Map<String, QuestionModel> getDB();
}
