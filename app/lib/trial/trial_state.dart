import 'package:flutter/material.dart';

import 'models/button_config.dart';
import 'models/exercise.dart';

class TrialState extends ChangeNotifier {
  int currentExerciseCounter = 0;
  Exercise currentExercise = Exercise(term: '', isTrue: true);
  List<Exercise> exercises = [
    Exercise(term: '1 + 1 = 2', isTrue: true),
    Exercise(term: '5 + 3 = 2', isTrue: false),
    Exercise(term: '2 - 1 = 5', isTrue: false),
    Exercise(term: '7 - 4 = 3', isTrue: true),
  ];
  late ButtonConfig currentButtonConfig;
  int correctAnsweredCounter = 0;
  int falseAnsweredCounter = 0;

  TrialState() {
    loadExercise();
    loadButtonConfig();
  }

  void loadExercise() {
    currentExercise = exercises[currentExerciseCounter];
    if (currentExerciseCounter < exercises.length) {
      currentExerciseCounter++;
    }
    notifyListeners();
  }

  void loadButtonConfig() {
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
