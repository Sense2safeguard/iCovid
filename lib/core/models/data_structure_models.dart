class QuestionModel {
  final String category;
  final String widgetType;
  final OptionsModel options;
  QuestionModel({this.category, this.widgetType, this.options});
}

class OptionsModel {
  final Map<String, Option> optionsMap;

  OptionsModel(this.optionsMap);
}

class Option {
  final String text;
  final String goTo;

  Option({this.text, this.goTo});
}
