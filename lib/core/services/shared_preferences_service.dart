import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _intance = UserPreferences._ctor();

  factory UserPreferences() {
    return _intance;
  }

  UserPreferences._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // general
  void clearPrefs() {
    _prefs.clear();
  }

  get userUid {
    return _prefs.getString("user");
  }

  Future setUserUid(String userUid) {
    return _prefs.setString("user", userUid);
  }

  // quiz
  get answers {
    return _prefs.getString("answers");
  }

  Future setAnswers(String answers) {
    return _prefs.setString("answers", answers);
  }

  get questionOrder {
    return _prefs.getString("questionOrder");
  }

  Future setQuestionOrder(String questionOrder) {
    return _prefs.setString("questionOrder", questionOrder);
  }

  get otherValue {
    return _prefs.getString("otherValue");
  }

  Future setOtherValue(String otherValue) {
    return _prefs.setString("otherValue", otherValue);
  }

  get navigatedQuestions {
    return _prefs.getStringList("navigatedOptions");
  }

  Future setNavigatedQuestions(List<String> navigatedQuestions) {
    return _prefs.setStringList("navigatedOptions", navigatedQuestions);
  }

  // post assessment
  void cleanCache() {
    _prefs.remove("questionOrder");
    _prefs.remove("answers");
    _prefs.remove("otherValue");
    _prefs.remove("selectedOption");
    _prefs.remove("resultsReceived");
  }

  get selectedOption {
    return _prefs.getString("selectedOption");
  }

  Future setSelectedOptions(String selectedOption) {
    return _prefs.setString("selectedOption", selectedOption);
  }

  get resultsReceived {
    return _prefs.getBool("resultsReceived");
  }

  Future setResultsReceived(bool value) {
    return _prefs.setBool("resultsReceived", value);
  }
}
