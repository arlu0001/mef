import 'package:flutter/material.dart';

class SurveyState extends ChangeNotifier {
  bool hasRedGreenBlindness = false;
  String? biologicalSex;
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
    notifyListeners();
  }
}