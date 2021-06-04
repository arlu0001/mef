import 'package:intl/intl.dart';

class Result {
  final String biologicalSex;
  final String age;
  final String smartphoneUsage;
  final String usageConfidence;
  final String correctAnsweredCount;
  final String falseAnsweredCount;
  final List<int> times;
  final List<int> reactions;
  final Duration totalTrialTime;
  final DateTime dateTime;

  const Result({
    required this.biologicalSex,
    required this.age,
    required this.smartphoneUsage,
    required this.usageConfidence,
    required this.correctAnsweredCount,
    required this.falseAnsweredCount,
    required this.totalTrialTime,
    required this.dateTime,
    required this.times,
    required this.reactions,
  });

  Map toJson() =>
      {
        'biologicalSex': biologicalSex,
        'age': age,
        'smartphoneUsage': smartphoneUsage,
        'usageConfidence': usageConfidence,
        'correctAnsweredCount': correctAnsweredCount,
        'falseAnsweredCount': falseAnsweredCount,
        'totalTrialTime': totalTrialTime.toString(),
        'dateTime': DateFormat('dd.MM.yyyy').add_Hm().format(dateTime),
        'times': times.join(";"),
        'reactions': reactions.join(";"),
      };
}

class TrialResult {
  final List<int> solveTimes;
  final List<int> reactions;
  final String correctAnswerCount;
  final String falseAnswerCount;
  final Duration totalTrialTime;
  final DateTime dateTime;

  TrialResult({
    required this.solveTimes,
    required this.reactions,
    required this.correctAnswerCount,
    required this.falseAnswerCount,
    required this.totalTrialTime,
    required this.dateTime,
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
