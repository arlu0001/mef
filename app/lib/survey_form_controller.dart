import 'package:app/survey_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SurveyFormController {
  static const String URL = "https://script.google.com/macros/s/AKfycbz_MDzOpeVzUv_u9SIp873CyQfZduNbN8YxprpKQbyaeD5aHlva/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  void submitForm(SurveyForm surveyForm, void Function(String) callback) async {
    try {
      await http.post(Uri.parse(URL), body: surveyForm.toJson()).then((response) async {
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