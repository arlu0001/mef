import 'package:app/api/google_sheet_api.dart';
import 'package:app/api/result.dart';
import 'package:flutter/material.dart';

class SurveyState extends ChangeNotifier {
  GoogleSheetApi api = GoogleSheetApi();

  late SurveyResult _surveyResult;

  final List<String> ishiharaImageNames = ['42', '3', 'lines'];
  int correctAnswers = 0;
  int wrongAnswers = 0;
  late String currentIshihara;
  int currentCounter = 0;

  String biologicalSex = '';
  String age = '';
  String smartphoneUsage = '';
  String usageConfidence = '';
  late String ishiharaTestResult3;
  late String ishiharaTestResult42;
  late String ishiharaTestResultLines;
  Stopwatch _ishiharaTestStopwatch = Stopwatch();

  SurveyState() {
    _loadIshiharaImage();
    _ishiharaTestStopwatch.start();
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
    notifyListeners();
  }

  void _loadIshiharaImage() {
    currentIshihara = ishiharaImageNames[currentCounter];
    if (currentCounter < ishiharaImageNames.length) {
      currentCounter++;
    }
    notifyListeners();
  }

  void setIshiharaResult(String value) {
    if (currentCounter - 1 == 0) {
      ishiharaTestResult3 = value;
      _loadIshiharaImage();
    } else if (currentCounter - 1 == 1) {
      ishiharaTestResult42 = value;
      _loadIshiharaImage();
    } else if (currentCounter - 1 == 2) {
      ishiharaTestResultLines = value;
      _ishiharaTestStopwatch.stop();
      _endSurvey();
    }
  }

  void _endSurvey() {
    _surveyResult = SurveyResult(
      biologicalSex: biologicalSex,
      age: age,
      smartphoneUsage: smartphoneUsage,
      usageConfidence: usageConfidence,
      ishiharaTestResult3: ishiharaTestResult3,
      ishiharaTestResult42: ishiharaTestResult42,
      ishiharaTestResultLines: ishiharaTestResultLines,
      ishiharaTestDuration: Duration(
        milliseconds: _ishiharaTestStopwatch.elapsedMilliseconds,
      ),
    );
    api.setSurveyResult(_surveyResult);
  }
}
