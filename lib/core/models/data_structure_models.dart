/// [questionsMap] is a Map of the total questions
class QuestionsModel {
  final Map<String, Question> questionsMap;

  QuestionsModel({this.questionsMap});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    Map<String, Question> map = {};
    json['questions'].forEach((key, value) {
      map[key] = Question.fromJson(value);
    });
    return QuestionsModel(questionsMap: map);
  }

  Map<String, dynamic> toJson() => {"questionsMap": questionsMap};
}

class Question {
  final String id;
  final String text;
  final bool hasOther;
  final String category;
  final String widgetType;
  final OptionsModel options;
  Question(
      {this.hasOther,
      this.id,
      this.text,
      this.category,
      this.widgetType,
      this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['id'],
        text: json['text'],
        hasOther: json['hasOther'].toString().toLowerCase() == 'true',
        category: json['category'],
        widgetType: json['widgetType'],
        options: OptionsModel.fromJson(json['options']));
  }

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "text": this.text,
        "category": this.category,
        "widgetType": this.widgetType,
        "options": this.options,
      };
}

class OptionsModel {
  final Map<String, Option> optionsMap;

  OptionsModel({this.optionsMap});

  factory OptionsModel.fromJson(Map json) {
    Map<String, Option> map = {};
    json.forEach((key, value) {
      map[key] = Option.fromJson(value);
    });
    return OptionsModel(optionsMap: map);
  }

  Map<String, dynamic> toJson() => {"optionsMap": optionsMap};
}

class Option {
  final String id;
  final String next;
  final String text;

  Option({this.id, this.text, this.next});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      next: json['next'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": this.id, "next": this.next, "text": this.text};
}

/// [storedAnswers]] is a Map of the total questions
class AnswersModel {
  Map<String, Answer> storedAnswers;

  AnswersModel({this.storedAnswers});

  factory AnswersModel.fromJson(Map<String, dynamic> json) {
    Map<String, Answer> map = {};

    json['storedAnswers'].forEach((key, value) {
      map[key] = Answer.fromJson(value);
    });
    return AnswersModel(storedAnswers: map);
  }

  Map<String, dynamic> toJson() => {"storedAnswers": storedAnswers};
}

class Answer {
  String questionId;
  List<String> selectedOptions;
  String otherValue;

  Answer({this.questionId, this.selectedOptions, this.otherValue});

  factory Answer.empty(String currentQuestionId) {
    return Answer(
        questionId: currentQuestionId, selectedOptions: [], otherValue: "");
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    var selectedOptionsFromJson = json['selectedOptions'];
    List<String> selectedOptions = List<String>.from(selectedOptionsFromJson);
    return Answer(
      questionId: json['questionId'],
      selectedOptions: selectedOptions,
      otherValue: json['otherValue'],
    );
  }

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "selectedOptions": selectedOptions,
        "otherValue": otherValue
      };
}

class Results {
  String infectionScore;
  String complicationScore;

  Results({this.complicationScore, this.infectionScore});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        complicationScore: json['complicationScore'],
        infectionScore: json['infectionScore']);
  }

  Map<String, dynamic> toJson() => {
        "infectionScore": infectionScore,
        "complicationScore": complicationScore
      };
}

class PostAssessment {
  DateTime date;
  String text;

  PostAssessment({this.date, this.text});
}
