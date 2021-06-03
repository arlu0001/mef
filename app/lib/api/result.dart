import 'dart:convert';

class Result {
  final String biologicalSex;
  final String age;
  final String smartphoneUsage;
  final String usageConfidence;
  final String correctAnsweredCount;
  final String falseAnsweredCount;
  final List<int> times;
  final List<int> reactions;

  const Result({
    required this.biologicalSex,
    required this.age,
    required this.smartphoneUsage,
    required this.usageConfidence,
    required this.correctAnsweredCount,
    required this.falseAnsweredCount,
    required this.times,
    required this.reactions,
  });

  Map toJson() => {
        'biologicalSex': biologicalSex,
        'age': age,
        'smartphoneUsage': smartphoneUsage,
        'usageConfidence': usageConfidence,
        'correctAnsweredCount': correctAnsweredCount,
        'falseAnsweredCount': falseAnsweredCount,
        'times': times.join(";"),
        'reactions': reactions.join(";"),
      };
}

class TrialResult {
  final List<int> solveTimes;
  final List<int> reactions;
  final String correctAnswerCount;
  final String falseAnswerCount;

  TrialResult({
    required this.solveTimes,
    required this.reactions,
    required this.correctAnswerCount,
    required this.falseAnswerCount,
  });
}

class SurveyResult {
  final String biologicalSex;
  final String age;
  final String smartphoneUsage;
  final String usageConfidence;

  SurveyResult({
    required this.biologicalSex,
    required this.age,
    required this.smartphoneUsage,
    required this.usageConfidence,
  });
}
