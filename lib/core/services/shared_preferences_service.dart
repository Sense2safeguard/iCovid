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

  get userUid {
    return _prefs.getString("user");
  }

  Future setUserUid(String userUid) {
    return _prefs.setString("user", userUid);
  }

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
}
