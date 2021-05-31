import 'package:app/api/google_sheet_api.dart';
import 'package:app/api/result.dart';
import 'package:flutter/material.dart';

class SurveyState extends ChangeNotifier {
  GoogleSheetApi api = GoogleSheetApi();

  late SurveyResult _surveyResult;

  bool hasRedGreenBlindness = false;
  String biologicalSex = '';
  String age = '';
  String smartphoneUsage = '';
  String usageConfidence = '';

  void setBiologicalSex(String value) {
    biologicalSex = value;
    notifyListeners();
  }

  void setAge(String value) {
    age = value;
    notifyListeners();
  }

  void setSmartphoneUsage(String value) {
    smartphoneUsage = value;
    notifyListeners();
  }

  void setUsageConfidence(String value) {
    usageConfidence = value;
    _endSurvey();
    notifyListeners();
  }

  void _endSurvey() {
    _surveyResult = SurveyResult(
      biologicalSex: biologicalSex,
      age: age,
      smartphoneUsage: smartphoneUsage,
      usageConfidence: usageConfidence,
    );
    api.setSurveyResult(_surveyResult);
  }
}
