import 'package:intl/intl.dart';

class Result {
  final String biologicalSex;
  final String age;
  final String smartphoneUsage;
  final String usageConfidence;
  final String correctAnsweredCount;
  final String falseAnsweredCount;
  final String ishiharaTestResult3;
  final String ishiharaTestResult42;
  final String ishiharaTestResultLines;
  final List<int> times;
  final List<int> reactions;
  final Duration totalTrialTime;
  final DateTime date;
  final DateTime time;

  const Result({
    required this.biologicalSex,
    required this.age,
    required this.smartphoneUsage,
    required this.usageConfidence,
    required this.correctAnsweredCount,
    required this.falseAnsweredCount,
    required this.ishiharaTestResult3,
    required this.ishiharaTestResult42,
    required this.ishiharaTestResultLines,
    required this.totalTrialTime,
    required this.date,
    required this.time,
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
        'ishiharaTestResult3': ishiharaTestResult3,
        'ishiharaTestResult42': ishiharaTestResult42,
        'ishiharaTestResultLines': ishiharaTestResultLines,
        'totalTrialTime': totalTrialTime.toString(),
        'date': DateFormat('dd.MM.yyyy').format(date),
        'time': DateFormat.Hm().format(date),
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
  final String ishiharaTestResult3;
  final String ishiharaTestResult42;
  final String ishiharaTestResultLines;

  SurveyResult({
    required this.biologicalSex,
    required this.age,
    required this.smartphoneUsage,
    required this.usageConfidence,
    required this.ishiharaTestResult3,
    required this.ishiharaTestResult42,
    required this.ishiharaTestResultLines,
  });
}
