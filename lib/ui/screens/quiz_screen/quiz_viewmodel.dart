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

  OptionsModel _options;
  OptionsModel get options => _options;

  void initialize() {
    getDB();
    calculateOrder();
    notifyListeners();
  }

  void calculateOrder() {
    _currentQuestion = _questions.questionsMap[_questionOrder];
    _options = _currentQuestion.options;
    notifyListeners();
  }

  void getDB() {
    _questions = dbService.getDB();
  }

  // Answers
  int _selectedOption;
  int get selectedOption => _selectedOption;

  String _selectedNext;
  String get selectedNext => _selectedNext;

  void setSelectedOption(int val) {
    _selectedOption = val;
    _selectedNext = _options.optionsMap[val.toString()].next;
    notifyListeners();
  }

  // Navigation
  void navigateNext() {
    // store answer to shared prefs
    // and some place to undo/back
    _questionOrder = _selectedNext;
    calculateOrder();
    notifyListeners();
  }

  // void navigateBack() {
  //   _questionOrder
  // }
}
