import 'package:app/api/google_sheet_api.dart';
import 'package:app/api/result.dart';
import 'package:app/route_names.dart';
import 'package:app/trial/models/exercise_list.dart';
import 'package:flutter/material.dart';

import 'models/button_config.dart';
import 'models/exercise.dart';

class TrialState extends ChangeNotifier {
  GoogleSheetApi api = GoogleSheetApi();

  late List<Exercise> exercises = getExercises;
  int currentExerciseCounter = 0;
  late Exercise currentExercise;
  late List<int> solveTimes;
  late List<int> reaction;
  late ButtonConfig currentButtonConfig;
  int correctAnsweredCounter = 0;
  int falseAnsweredCounter = 0;
  Stopwatch _reactionStopwatch = Stopwatch();
  Stopwatch _trialStopwatch = Stopwatch();
  late TrialResult _trialResult;
  late DateTime dateTime;

  TrialState() {
    solveTimes = List.filled(exercises.length, 0);
    reaction = List.filled(exercises.length, 0);
    _loadExercise();
    _trialStopwatch.start();
    dateTime = DateTime.now();
    _loadButtonConfig();
  }

  void finish(BuildContext context) {
    _reactionStopwatch.stop();
    solveTimes[currentExerciseCounter - 1] = _reactionStopwatch.elapsedMilliseconds;
    _reactionStopwatch.reset();

    print('-------------------------------------------------------');
    print('Zeit: ${solveTimes[currentExerciseCounter - 1]}');
    print('-------------------------------------------------------');

    if (currentExerciseCounter == exercises.length) {
      _trialStopwatch.stop();
      int completionTime = _trialStopwatch.elapsedMilliseconds;
      Duration d = Duration(milliseconds: completionTime);
      print('Zeit insgesamt: $d ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
      Navigator.pushNamed(context, startIshiharaRoute);
      print('Richtig beantwortet: $correctAnsweredCounter');
      print('Falsch beantwortet: $falseAnsweredCounter');
      print('-------------------------------------------------------');
      _trialResult = TrialResult(
        solveTimes: solveTimes,
        reactions: reaction,
        correctAnswerCount: correctAnsweredCounter.toString(),
        falseAnswerCount: falseAnsweredCounter.toString(),
        totalTrialTime: d,
        dateTime: dateTime,
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
    _reactionStopwatch.start();
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

  // 1: buttonTitle: 'Richtig', color: 'green', result: true
  // 2: buttonTitle: 'Richtig', color: 'green', result: false
  // 3: buttonTitle: 'Richtig', color: 'red', result: true;
  // 4: buttonTitle: 'Richtig', color: 'red', result: false;
  // 5: buttonTitle: 'Falsch', color: 'green', result: true;
  // 6: buttonTitle: 'Falsch', color: 'green', result: false;
  // 7: buttonTitle: 'Falsch', color: 'red', result: true;
  // 8: buttonTitle: 'Falsch', color: 'red', result: false;
  void analyzeReaction(String buttonTitle, Color buttonColor) {
    bool btnTitle = buttonTitle == 'Richtig';
    bool btnColor = buttonColor == Colors.green;
    bool result = currentExercise.isTrue;

    if (btnTitle && btnColor && result) {
      reaction[currentExerciseCounter - 1] = 1;
    } else if (btnColor && btnColor && !result) {
      reaction[currentExerciseCounter - 1] = 2;
    } else if (btnTitle && !btnColor && result) {
      reaction[currentExerciseCounter - 1] = 3;
    } else if (btnTitle && !btnColor && !result) {
      reaction[currentExerciseCounter - 1] = 4;
    } else if (!btnTitle && btnColor && result) {
      reaction[currentExerciseCounter - 1] = 5;
    } else if (!btnTitle && btnColor && !result) {
      reaction[currentExerciseCounter - 1] = 6;
    } else if (!btnTitle && !btnColor && result) {
      reaction[currentExerciseCounter - 1] = 7;
    } else if (!btnTitle && !btnColor && !result) {
      reaction[currentExerciseCounter - 1] = 8;
    }
  }
}
