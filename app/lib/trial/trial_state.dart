import 'package:flutter/material.dart';
import 'dart:math';

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
}

class Exercise {
  final String term;
  final bool isTrue;

  Exercise({required this.term, required this.isTrue});
}

class ButtonConfig {
  late final String buttonTitle1;
  late final Color buttonBackgroundColor1;
  late final String buttonTitle2;
  late final Color buttonBackgroundColor2;

  List<String> titles = ['Richtig', 'Falsch'];
  List<Color> colors = [Colors.green, Colors.red];

  ButtonConfig() {
    _randomizeConfig();
  }

  void _randomizeConfig() {
    var random = Random();

    this.buttonTitle1 = titles[random.nextInt(titles.length)];
    this.buttonBackgroundColor1 = colors[random.nextInt(colors.length)];

    if(buttonTitle1 == titles[0])
      buttonTitle2 = titles[1];
    else
      buttonTitle2 = titles[0];

    if(buttonBackgroundColor1 == colors[0])
      buttonBackgroundColor2 = colors[1];
    else
      buttonBackgroundColor2 = colors[0];
  }
}
