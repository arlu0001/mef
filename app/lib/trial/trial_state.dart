import 'package:flutter/material.dart';

class TrialState extends ChangeNotifier {
  int currentExerciseCounter = 0;
  Exercise currentExercise = Exercise(term: '', isTrue: true);
  List<Exercise> exercises = [
    Exercise(term: '1 + 1 = 2', isTrue: true),
    Exercise(term: '5 + 3 = 2', isTrue: false),
    Exercise(term: '2 - 1 = 5', isTrue: false),
    Exercise(term: '7 - 4 = 3', isTrue: true),
  ];

  TrialState() {
    loadExercise();
  }

  void loadExercise() {
    currentExercise = exercises[currentExerciseCounter];
    if(currentExerciseCounter < exercises.length) {
      currentExerciseCounter++;
    }
    notifyListeners();
  }
}

class Exercise {
  final String term;
  final bool isTrue;

  Exercise({required this.term, required this.isTrue});
}
