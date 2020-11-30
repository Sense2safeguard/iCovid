import 'package:flutter/cupertino.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/db_service_mocked.dart';

class QuizViewmodel extends ChangeNotifier {
  QuizViewmodel() {
    initialize();
  }

  QuizViewmodel.forTesting() {
    getDataBase();
    calculateOrder("3");
    _answers = AnswersModel(storedAnswers: {
      "1": Answer(
          questionId: "1",
          selectedOptions: ["1", "2", "11"],
          otherValue: "Other value"),
      "2": Answer(questionId: "2", selectedOptions: ["1"]),
    });
  }

  DBServiceMocked dbService = DBServiceMocked();

  // Questions
  QuestionsModel _questions;
  Question _currentQuestion;
  String _questionOrder = "1";
  bool _isOtherVisible = false;
  bool _hasOther;
  String _otherValue;
  String _widgetType;

  // Options
  OptionsModel _currentOptions;

  // Answers
  String _selectedOption;
  List<String> _selectedOptions;
  String _selectedNext;
  AnswersModel _answers;
  bool _isNextDisabled = true;
  bool _isNoneSelected = false;

  void initialize() {
    getDataBase();
    calculateOrder();
    initializeAnswers();
    computeOther();
    notifyListeners();
  }

  void getDataBase() {
    _questions = dbService.getDB();
  }

  /// This will prepare all the configuration for next option
  /// Shared Prefs will resume on [_questionOrder]
  void calculateOrder([String questionOrder]) {
    _currentQuestion = questionOrder != null
        ? _questions.questionsMap[questionOrder]
        : _questions.questionsMap[_questionOrder];
    _currentOptions = _currentQuestion.options;
    _selectedOption = null;
    _widgetType = _currentQuestion.widgetType;

    notifyListeners();
  }

  void initializeAnswers() {
    if (_answers == null || _answers.storedAnswers == null)
      _answers = AnswersModel(storedAnswers: {
        _currentQuestion.id: Answer.empty(_currentQuestion.id)
      });

    if (_answers.storedAnswers[_currentQuestion.id] == null) {
      _answers.storedAnswers[_currentQuestion.id] =
          Answer.empty(_currentQuestion.id);
    }

    if (_answers.storedAnswers[_currentQuestion.id].selectedOptions == null) {
      _selectedOptions = [];
    } else {
      _selectedOptions =
          _answers.storedAnswers[_currentQuestion.id].selectedOptions;
    }
  }

  // NAVIGATION
  // Moving forward
  void navigateNext() {
    saveOtherValue();
    selectNext();
    calculateOrder(_selectedNext);
    initializeAnswers();
    computeOther();
    calculateNextDisabled();

    notifyListeners();
  }

  // Moving backwards
  void navigateBack() {
    saveOtherValue();
    calculateOrder(calculateLastStoredAnswer());
    selectNext();
    computeOther();
    calculateNextDisabled();

    notifyListeners();
  }

  String calculateLastStoredAnswer() {
    List<String> answersIds = [];
    _answers.storedAnswers.forEach((key, value) {
      answersIds.add(key);
    });
    int currentQuestionIndex = answersIds.indexOf(_currentQuestion.id);

    return answersIds[currentQuestionIndex - 1];
  }

  void computeOther() {
    _isOtherVisible =
        !(_answers.storedAnswers[_currentQuestion.id].otherValue == "" ||
            _answers.storedAnswers[_currentQuestion.id].otherValue == null);

    _otherValue = _answers.storedAnswers[_currentQuestion.id].otherValue != null
        ? _answers.storedAnswers[_currentQuestion.id].otherValue
        : null;

    _hasOther = _currentQuestion.hasOther;
  }

  void saveOtherValue() {
    if (_hasOther && _otherValue != null && _isOtherVisible ||
        hasOther && _otherValue != "" && _isOtherVisible)
      _answers.storedAnswers[_currentQuestion.id].otherValue = _otherValue;
  }

  void calculateNextDisabled() {
    if (_answers.storedAnswers[_currentQuestion.id].selectedOptions.length >
            0 &&
        !_isOtherVisible) {
      _isNextDisabled = false;
    } else {
      _isNextDisabled = true;
    }
    notifyListeners();
  }

  void storeAnswers(String optionId, [String text]) {
    _selectedOption = optionId;
    initializeAnswers();

    if (!_selectedOptions.contains(optionId)) {
      if (text == "None") _selectedOptions.clear();
      // TODO: !!! this is hardcoded! I've lost calculation on commits
      if (_selectedOptions.length == 1 && _selectedOptions.contains("12"))
        _selectedOptions.clear();
      _selectedOptions.add(optionId);
    } else {
      _selectedOptions.remove(optionId);
    }

    if (_widgetType == "DialSelection" ||
        _widgetType == "SingleCheckableSelection" ||
        _widgetType == "SingleScrollableSelection" ||
        _widgetType == "SingleScrolabblePillSelection" ||
        _widgetType == "SingleRadioSelection") {
      _selectedOptions.clear();
      _selectedOptions.add(optionId);
    }

    if (_widgetType == "DialSelection" && optionId == "0")
      _selectedOptions.clear();

    _answers.storedAnswers[_currentQuestion.id] = Answer(
        questionId: _currentQuestion.id, selectedOptions: _selectedOptions);
    calculateNextDisabled();
  }

  String getNoneOptionId() {
    String computedOptionId;
    _currentOptions.optionsMap.forEach((key, value) {
      if (value.text == "None")
        computedOptionId = (int.parse(key) + 1).toString();
    });
    return computedOptionId;
  }

  void updateOtherValue(String otherValue) {
    _otherValue = otherValue;
  }

  void selectNext([String index]) {
    if (_widgetType != "DialSelection" &&
        _answers.storedAnswers[_currentQuestion.id].selectedOptions.length >
            0) {
      _selectedNext = _currentOptions
          .optionsMap[
              _answers.storedAnswers[_currentQuestion.id].selectedOptions[0]]
          .next;
    } else {
      _selectedNext = index != null
          ? _currentOptions.optionsMap[index].next
          : _currentOptions.optionsMap["1"].next;
    }

    notifyListeners();
  }

  void otherVisible(String optionText) {
    if (optionText == "Other" && _hasOther ||
        optionText == "Yes" && _hasOther) {
      toggleOtherVisible();
    } else {
      if (_widgetType != "MultiplePillSelection") {
        _isOtherVisible = false;
      }
    }
    notifyListeners();
  }

  bool amISelected(String text, String index) {
    if (text == "None" && _isNoneSelected == true) {
      return true;
    }
    if (text == "None" && _isNoneSelected == false) {
      return false;
    } else if (text != "None" &&
        _answers.storedAnswers[_currentQuestion.id].selectedOptions
            .contains(index) &&
        _isNoneSelected == false) {
      return true;
    } else {
      return false;
    }
  }

  void toggleNoneSelected(String text) {
    if (text == "None") {
      _isNoneSelected = !_isNoneSelected;
    } else {
      _isNoneSelected = false;
    }
  }

  void toggleOtherVisible() {
    _isOtherVisible = !_isOtherVisible;
    notifyListeners();
  }

  // Getters
  QuestionsModel get questions => _questions;
  Question get currentQuestion => _currentQuestion;
  String get questionOrder => _questionOrder;

  OptionsModel get currentOptions => _currentOptions;
  AnswersModel get answers => _answers;

  String get selectedOption => _selectedOption;
  String get selectedNext => _selectedNext;
  bool get isNextDisabled => _isNextDisabled;
  bool get isNoneSelected => _isNoneSelected;

  bool get isOtherVisible => _isOtherVisible;
  String get otherValue => _otherValue;
  bool get hasOther => _hasOther;

  String get widgetType => _widgetType;
}
