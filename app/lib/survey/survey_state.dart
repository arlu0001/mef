import 'package:app/api/google_sheet_api.dart';
import 'package:app/api/result.dart';
import 'package:flutter/material.dart';

class SurveyState extends ChangeNotifier {
  GoogleSheetApi api = GoogleSheetApi();

  late SurveyResult _surveyResult;

  final List ishiharaTestCorrectAnswers = [42, 3, 74];
  int correctAnswers = 0;
  int wrongAnswers = 0;
  late int currentIshihara;
  int currentCounter = 0;

  String biologicalSex = '';
  String age = '';
  String smartphoneUsage = '';
  String usageConfidence = '';
  late int ishiharaTestResult;

  SurveyState() {
    _loadIshiharaImage();
  }

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

  void _loadIshiharaImage(){
    currentIshihara = ishiharaTestCorrectAnswers[currentCounter];
    if(currentCounter < ishiharaTestCorrectAnswers.length) {
      currentCounter++;
    }
    notifyListeners();
  }

  void countAnswers(String answer) {
    if(answer == currentIshihara.toString()) {
      correctAnswers++;
    } else {
      wrongAnswers++;
    }
    _loadIshiharaImage();
  }

  void _endSurvey() {
    if(correctAnswers == 3) {
      // no red-green blindness
      ishiharaTestResult = 1;
    } else if (wrongAnswers == 3) {
      // red-green blindness
      ishiharaTestResult = 2;
    } else {
      // some red-green blindness
      ishiharaTestResult = 3;
    }
    _surveyResult = SurveyResult(
      biologicalSex: biologicalSex,
      age: age,
      smartphoneUsage: smartphoneUsage,
      usageConfidence: usageConfidence,
      redGreenBlindness: ishiharaTestResult.toString(),
    );
    api.setSurveyResult(_surveyResult);
  }
}
