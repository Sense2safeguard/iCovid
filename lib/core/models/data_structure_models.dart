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
}
