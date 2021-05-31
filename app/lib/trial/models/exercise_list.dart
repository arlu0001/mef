import 'exercise.dart';

const int exerciseAmount = 6;

List<Exercise> get getExercises => _createExerciseList();

List<Exercise> _createExerciseList() {
  List<Exercise> correctExercises = List.generate(
    exerciseAmount,
    (index) => Exercise.correct(),
  );
  List<Exercise> wrongExercises = List.generate(
    exerciseAmount,
    (index) => Exercise.wrong(),
  );

  List<Exercise> exercises = correctExercises + wrongExercises;
  exercises.shuffle();

  for(int i = 0; i < exercises.length; i++) {
    print(exercises[i].toString());
  }

  return exercises;
}
