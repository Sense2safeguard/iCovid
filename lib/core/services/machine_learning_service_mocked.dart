import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/machine_learning_service.dart';

class MLServiceMocked implements MachineLearningService {
  String infectionScoreMocked = "89";
  String complicationScoreMocked = "43";

  @override
  Results getResultsFromServer() {
    return Results(
        complicationScore: complicationScoreMocked,
        infectionScore: infectionScoreMocked);
  }
}
