import 'package:app/api/google_sheet_api.dart';
import 'package:app/api/result.dart';
import 'package:app/route_names.dart';
import 'package:flutter/material.dart';

import 'models/button_config.dart';
import 'models/exercise.dart';

class TrialState extends ChangeNotifier {
  GoogleSheetApi api = GoogleSheetApi();

  int currentExerciseCounter = 0;
  Exercise currentExercise = Exercise(term: '', isTrue: true);
  List<Exercise> exercises = [
    Exercise(term: '1 + 1 = 2', isTrue: true),
    Exercise(term: '5 + 3 = 2', isTrue: false),
    Exercise(term: '2 - 1 = 5', isTrue: false),
    Exercise(term: '7 - 4 = 3', isTrue: true),
  ];
  List solveTimes = List.filled(4, 0);
  late ButtonConfig currentButtonConfig;
  int correctAnsweredCounter = 0;
  int falseAnsweredCounter = 0;
  Stopwatch _stopwatch = Stopwatch();
  late TrialResult _trialResult;

  TrialState() {
    _loadExercise();
    _loadButtonConfig();
  }

  void finish(BuildContext context) {
    _stopwatch.stop();
    solveTimes[currentExerciseCounter - 1] = _stopwatch.elapsedMilliseconds;
    _stopwatch.reset();

    print('-------------------------------------------------------');
    print('Zeit: ${solveTimes[currentExerciseCounter - 1]}');
    print('-------------------------------------------------------');

    if (currentExerciseCounter == exercises.length) {
      Navigator.pushNamed(context, colorBlindnessTestScreen);
      print('Richtig beantwortet: $correctAnsweredCounter');
      print('Falsch beantwortet: $falseAnsweredCounter');
      print('-------------------------------------------------------');
      _trialResult = TrialResult(
        solveTimes: solveTimes,
        correctAnswerCount: correctAnsweredCounter.toString(),
        falseAnswerCount: falseAnsweredCounter.toString(),
      );
      api.setTrialResults(_trialResult);
    } else {
      _loadExercise();
      _loadButtonConfig();
    }
  }

  void _loadExercise() {
    currentExercise = exercises[currentExerciseCounter];
    if (currentExerciseCounter < exercises.length) {
      currentExerciseCounter++;
    }
    notifyListeners();
    _stopwatch.start();
  }

  void _loadButtonConfig() {
    currentButtonConfig = ButtonConfig();
    notifyListeners();
  }

  void countAnswers(String buttonTitle) {
    if (buttonTitle == 'Richtig' && currentExercise.isTrue) {
      correctAnsweredCounter++;
    } else if (buttonTitle == 'Richtig' && !currentExercise.isTrue) {
      falseAnsweredCounter++;
    } else if (buttonTitle == 'Falsch' && !currentExercise.isTrue) {
      correctAnsweredCounter++;
    } else if (buttonTitle == 'Falsch' && currentExercise.isTrue) {
      falseAnsweredCounter++;
    }
  }
}
