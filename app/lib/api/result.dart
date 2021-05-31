class Result {
  final String biologicalSex;
  final String age;
  final String smartphoneUsage;
  final String usageConfidence;
  final String correctAnsweredCount;
  final String falseAnsweredCount;
  final String exercise1Time;
  final String exercise2Time;
  final String exercise3Time;
  final String exercise4Time;

  const Result({
    required this.biologicalSex,
    required this.age,
    required this.smartphoneUsage,
    required this.usageConfidence,
    required this.correctAnsweredCount,
    required this.falseAnsweredCount,
    required this.exercise1Time,
    required this.exercise2Time,
    required this.exercise3Time,
    required this.exercise4Time,
  });

  Map toJson() => {
        'biologicalSex': biologicalSex,
        'age': age,
        'smartphoneUsage': smartphoneUsage,
        'usageConfidence': usageConfidence,
        'correctAnsweredCount': correctAnsweredCount,
        'falseAnsweredCount': falseAnsweredCount,
        'exercise1Time': exercise1Time,
        'exercise2Time': exercise2Time,
        'exercise3Time': exercise3Time,
        'exercise4Time': exercise4Time,
      };
}

class TrialResult {
  final List solveTimes;
  final String correctAnswerCount;
  final String falseAnswerCount;

  TrialResult({
    required this.solveTimes,
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
