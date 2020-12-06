import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/auth_firebase_service.dart';
import 'package:iCovid/core/services/db_service_mocked.dart';
import 'package:iCovid/core/services/machine_learning_service_mocked.dart';
import 'package:iCovid/core/services/shared_preferences_service.dart';

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
  MLServiceMocked mlService = MLServiceMocked();
  AuthFirebaseService _auth = AuthFirebaseService();

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

  // Answers and Navigation
  String _selectedOption;
  List<String> _selectedOptions;
  String _selectedNext;
  AnswersModel _answers;
  Answer _answer;
  bool _isNextDisabled = true;
  bool _isNoneSelected = false;

  // Results
  Results _results;

  // User
  User user;

  void initialize() {
    getDataBase();

    // to resume the app
    if (UserPreferences().questionOrder != null) {
      _questionOrder = UserPreferences().questionOrder;
      _otherValue = UserPreferences().otherValue;
      _answers = AnswersModel.fromJson(jsonDecode(UserPreferences().answers));
    }
    calculateOrder();
    initializeAnswers();
    computeOther();

    // to resume the app
    if (UserPreferences().questionOrder != null) calculateNextDisabled();

    notifyListeners();
  }

  void resetQuiz() {
    _questionOrder = "1";
    _currentQuestion = _questions.questionsMap[questionOrder];
    _currentOptions = _currentQuestion.options;
    _selectedOption = null;

    _isOtherVisible = false;
    _hasOther = null;
    _otherValue = null;

    _widgetType = _currentQuestion.widgetType;

    _answers = null;
    _answer = null;

    _isNextDisabled = true;
    _isNoneSelected = false;

    initializeAnswers();
    computeOther();
    cleanCache();

    notifyListeners();
  }

  void getDataBase() {
    _questions = dbService.getDB();
  }

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

    _answer = _answers.storedAnswers[_currentQuestion.id];

    if (_answer.selectedOptions == null) {
      _selectedOptions = [];
    } else {
      _selectedOptions = _answer.selectedOptions;
    }
  }

  void navigateNext() async {
    saveOtherValue();

    if (_currentQuestion.id == (_questions.questionsMap.length - 1).toString())
      await sendQuiz(UserPreferences().userUid);

    selectNext();
    cachePrefs();
    calculateOrder(_selectedNext);
    initializeAnswers();
    computeOther();
    calculateNextDisabled();

    if (_currentQuestion.widgetType == "ScoreResults") await getResultsMocked();

    notifyListeners();
  }

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
    _answer = _answers.storedAnswers[_currentQuestion.id];

    _isOtherVisible = !(_answer.otherValue == "" || _answer.otherValue == null);
    _otherValue = _answer.otherValue != null ? _answer.otherValue : null;
    _hasOther = _currentQuestion.hasOther;
  }

  void updateOtherValue(String otherValue) {
    _otherValue = otherValue;
  }

  void saveOtherValue() {
    _answer = _answers.storedAnswers[_currentQuestion.id];

    if (_hasOther && _otherValue != null && _isOtherVisible ||
        hasOther && _otherValue != "" && _isOtherVisible)
      _answer.otherValue = _otherValue;
  }

  void calculateNextDisabled() {
    _answer = _answers.storedAnswers[_currentQuestion.id];

    if (_answer.otherValue != null && _isOtherVisible ||
        // _answer.selectedOptions[0] != "" ||
        _answer.selectedOptions.length > 0 && !_isOtherVisible ||
        _answer.selectedOptions.contains(getOptionId("Other")) &&
            _answer.otherValue != null) {
      _isNextDisabled = false;
    } else if (_widgetType == "ScoreResults") {
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
      if (text != "None" && _selectedOptions.contains(getOptionId("None")))
        _selectedOptions.clear();

      if (_selectedOptions.length == 1 && _selectedOptions.contains(optionId)) {
        _selectedOptions.clear();
      }

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

    if (_widgetType == "DialSelection" && optionId == "0" ||
        _widgetType == "DialSelection" && optionId == "")
      _selectedOptions.clear();

    _answers.storedAnswers[_currentQuestion.id] = Answer(
        questionId: _currentQuestion.id, selectedOptions: _selectedOptions);

    if ((text == "Other" || text == "No") && _answer.otherValue != null) {
      _answer.otherValue = null;
      _otherValue = null;
    }

    saveOtherValue();
  }

  void cachePrefs() {
    UserPreferences().setAnswers(jsonEncode(_answers));
    UserPreferences().setQuestionOrder(_currentQuestion.id);
    UserPreferences().setOtherValue(_otherValue);
  }

  void cleanCache() {
    UserPreferences().setAnswers("");
    UserPreferences().setQuestionOrder("");
    UserPreferences().setOtherValue("");
  }

  void updateTestOption(String index) {
    _selectedOption = index;
    notifyListeners();
  }

  String getOptionId(String text) {
    String computedOptionId;

    _currentOptions.optionsMap.forEach((key, value) {
      if (value.text == text) computedOptionId = (int.parse(key)).toString();
    });

    return computedOptionId;
  }

  void selectNext([String index]) {
    _answer = _answers.storedAnswers[_currentQuestion.id];

    if (_widgetType != "DialSelection" && _answer.selectedOptions.length > 0) {
      _selectedNext =
          _currentOptions.optionsMap[_answer.selectedOptions[0]].next;
    } else {
      _selectedNext = index != null
          ? _currentOptions.optionsMap[index].next
          : _currentOptions.optionsMap["1"].next;
    }

    notifyListeners();
  }

  void otherVisible(String optionText) {
    _answer = _answers.storedAnswers[_currentQuestion.id];

    if (optionText == "Other" && _hasOther ||
        optionText == "Yes" && _hasOther) {
      toggleOtherVisible();
    } else if (optionText == "None" && _hasOther && _isOtherVisible) {
      _isOtherVisible = false;
      _otherValue = null;
      _answer.otherValue = null;
    } else {
      if (_widgetType != "MultiplePillSelection") {
        _isOtherVisible = false;
      }
    }

    notifyListeners();
  }

  bool amISelected(String text, String index) {
    _answer = _answers.storedAnswers[_currentQuestion.id];

    if (text == "None" && _isNoneSelected == true) {
      return true;
    }

    if (text == "None" && _isNoneSelected == false) {
      return false;
    } else if (text != "None" &&
        _answer.selectedOptions.contains(index) &&
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

  Future signInAnon() async {
    user = await _auth.signInAnon();
    if (user != null) UserPreferences().setUserUid(user.uid);
    // notifyListeners();
    return user;
  }

  Future sendQuiz(String userUid) async {
    var response = mlService.sendQuiz(
        questions: _questions, answers: _answers, userUid: userUid);
    print(response);
  }

  void getResultsMocked() async {
    _results = await mlService.getResultsFromServer();
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

  Results get results => _results;
}
