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
      "https://script.google.com/macros/s/AKfycbzAypzXqOfcXpfoG1a_jhuzfP4Ci0VtXXa4Ov5DCczn6kKq2Wc/exec";

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
      os: getOs(),
      smartphoneUsage: _surveyResult.smartphoneUsage,
      usageConfidence: _surveyResult.usageConfidence,
      ishiharaTestResult3: _surveyResult.ishiharaTestResult3,
      ishiharaTestResult42: _surveyResult.ishiharaTestResult42,
      ishiharaTestResultLines: _surveyResult.ishiharaTestResultLines,
      ishiharaTestDuration: _surveyResult.ishiharaTestDuration,
      correctAnsweredCount: _trialResult.correctAnswerCount,
      falseAnsweredCount: _trialResult.falseAnswerCount,
      totalTrialTime: _trialResult.totalTrialTime,
      date: _trialResult.dateTime,
      time: _trialResult.dateTime,
      times: _trialResult.solveTimes,
      reactions: _trialResult.reactions,
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
    } on Exception catch (e) {
      print(e);
    }
  }

  String getOs() {
    if (userAgent.contains('iphone')) {
      return 'iOS';
    } else if (userAgent.contains('ipad')) {
      return 'iPad';
    } else if (userAgent.contains('android')) {
      return 'Android';
    } else {
      return '-';
    }
  }
}
