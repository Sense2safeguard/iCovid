import 'package:flutter/cupertino.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/core/services/shared_preferences_service.dart';

class PostAssessmentViewmodel extends ChangeNotifier {
  PostAssessmentViewmodel() {
    initialize();
  }

  final List<String> titles = [
    'If you have consulted a doctor or performed a Covid-19 test, please share the result with us',
    'Have you been sent to ICU for further tests and treatment?'
  ];

  final List<Option> options = [
    Option(id: "1", text: "Negative Test"),
    Option(id: "2", text: "Positive Test"),
  ];

  String _selectedOption;
  bool _isSentTestScreen = true;
  bool _areObservationsSent = false;
  bool _isDisabled;

  TextEditingController textController = TextEditingController();

  bool arrivedPostAssessment = UserPreferences().userUid != null &&
      UserPreferences().selectedOption != null;

  // for future requests
  // PostAssessment _postAssessment;
  // String _postAssessmentResult;

  void initialize() {
    checkisDisabled();

    if (arrivedPostAssessment) {
      _selectedOption = UserPreferences().selectedOption;

      if (_selectedOption == "1" || _selectedOption == "2") {
        _isSentTestScreen = false;
        _areObservationsSent = false;
        _isDisabled = true;
      } else {
        _isSentTestScreen = true;
        _areObservationsSent = false;
        _isDisabled = true;
      }
    }
  }

  void checkisDisabled() {
    _isDisabled = _selectedOption == "" || _selectedOption == null;
    notifyListeners();
  }

  void toggleIsDisabled() {
    _isDisabled = !_isDisabled;
    notifyListeners();
  }

  void areObservationsSentToTrue() {
    _areObservationsSent = true;
    notifyListeners();
  }

  void updateSelectedOptionOrValue(String text) {
    _selectedOption = text;
    notifyListeners();
  }

  void sendTestResults() {
    _isSentTestScreen = false;
    notifyListeners();
  }

  String get selectedOption => _selectedOption;
  bool get isSentTestScreen => _isSentTestScreen;
  bool get areObservationsSent => _areObservationsSent;
  bool get isDisabled => _isDisabled;
}
