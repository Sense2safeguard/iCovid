import 'package:flutter/cupertino.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/db_service_mocked.dart';

class QuizViewmodel extends ChangeNotifier {
  QuizViewmodel() {
    initialize();
  }

  DBServiceMocked dbService = DBServiceMocked();

  // Questions
  QuestionsModel _questions;
  QuestionsModel get questions => _questions;

  String _questionOrder = "1";

  Question _currentQuestion;
  Question get currentQuestion => _currentQuestion;

  // Options
  OptionsModel _options;
  OptionsModel get options => _options;

  void initialize() {
    getDataBase();
    calculateOrder();
    notifyListeners();
  }

  void getDataBase() {
    _questions = dbService.getDB();
  }

  void calculateOrder() {
    _currentQuestion = _questions.questionsMap[_questionOrder];
    _options = _currentQuestion.options;
    notifyListeners();
  }

  // Answers
  // with Options
  String _selectedOption;
  String get selectedOption => _selectedOption;

  String _selectedNext;
  String get selectedNext => _selectedNext;

  // with Multiple Options
  List<String> _storedOption = [];
  bool _isOtherVisible = false;
  bool get isOtherVisible => _isOtherVisible;

  void toggleOtherVisible() {
    _isOtherVisible = !_isOtherVisible;
    notifyListeners();
  }

  // it works also for single selection with other
  void setAndStoreOption(
      String optionText, String index, String widgetType, bool hasOther) {
    _selectedOption = index;

    if (!_storedOption.contains(optionText)) {
      _storedOption.add(optionText);
    } else {
      _storedOption.remove(optionText);
    }
    if (optionText == "Other" && hasOther || optionText == "Yes" && hasOther) {
      toggleOtherVisible();
    } else {
      if (widgetType != "MultiplePillSelection") {
        _isOtherVisible = false;
      }
    }

    _selectedNext = _currentQuestion.options.optionsMap[index].next;
    notifyListeners();
  }

  // TODO: delete if setAndStore works
  // void setSelectedOption(String index) {
  //   _selectedOption = index;
  //   _selectedNext = _options.optionsMap[index].next;
  //   notifyListeners();
  // }

  // TODO: refactor to cover all methods in one
  // with Dials and Date selectors
  List<Map<String, int>> _selectedDials = [];

  void setDialSelected(String dialText, int counterVal) {
    Map<String, int> _dialMap = {dialText: counterVal};
    if (!_selectedDials.contains(_dialMap)) {
      _selectedDials.add(_dialMap);
    } else {
      _selectedDials.remove(_dialMap);
    }
    _selectedNext = _currentQuestion.options.optionsMap["1"].next;
  }

  // Navigation
  void navigateNext() {
    // store answer to shared prefs
    // and some place to undo/back
    _questionOrder = _selectedNext;
    calculateOrder();
    _isOtherVisible = false;
    _selectedOption = null;
    notifyListeners();
  }

  // void navigateBack() {
  //   _questionOrder
  // }
}
