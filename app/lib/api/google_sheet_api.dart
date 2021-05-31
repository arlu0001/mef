import 'package:app/api/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GoogleSheetApi {
  static final GoogleSheetApi _instance = GoogleSheetApi._internal();

  factory GoogleSheetApi() {
    return _instance;
  }

  GoogleSheetApi._internal();

  static const String URL =
      "https://script.google.com/macros/s/AKfycbz04pXbW-rw5KgSxwKgh2Db3rCmiqGPyZkAInQeqR6IsNEaoq-K/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  late Result result;
  late TrialResult _trialResult;
  late SurveyResult _surveyResult;

  void setTrialResults(TrialResult trialResult) {
    _trialResult = trialResult;
  }

  void setSurveyResult(SurveyResult surveyResult) {
    _surveyResult = surveyResult;
  }

  void prepareResult() {
    result = Result(
      biologicalSex: _surveyResult.biologicalSex,
      age: _surveyResult.age,
      smartphoneUsage: _surveyResult.smartphoneUsage,
      usageConfidence: _surveyResult.usageConfidence,
      correctAnsweredCount: _trialResult.correctAnswerCount,
      falseAnsweredCount: _trialResult.falseAnswerCount,
      exercise1Time: _trialResult.solveTimes[0].toString(),
      exercise2Time: _trialResult.solveTimes[1].toString(),
      exercise3Time: _trialResult.solveTimes[2].toString(),
      exercise4Time: _trialResult.solveTimes[3].toString(),
    );
  }

  void submitForm(void Function(String) callback) async {
    try {
      await http.post(Uri.parse(URL), body: result.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url!)).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
