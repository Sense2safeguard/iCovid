import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/machine_learning_service.dart';

class MLServiceMocked implements MachineLearningService {
  String infectionScoreMocked = "55";
  String complicationScoreMocked = "19";

  @override
  Future getResultsFromServer() async {
    Results results = Results(
        complicationScore: complicationScoreMocked,
        infectionScore: infectionScoreMocked);
    return results;
  }

  Future<http.Response> sendQuiz(
      {QuestionsModel questions, AnswersModel answers, String userUid}) async {
    // String path = "https://icovidcloud.xyz/test";
    String path = "https://30538e3a2433f3e37e057e14b3be6e18.m.pipedream.net";

    http.Response response;

    response = await http.post(path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user": userUid,
          "questions": jsonEncode(questions),
          "answers": jsonEncode(answers),
        }));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception(response.body);
    }

    return response;
  }
}
