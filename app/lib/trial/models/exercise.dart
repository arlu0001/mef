import 'dart:math';

class Exercise {
  late final String term;
  late final bool isTrue;

  var random = Random();
  List<int> numbers = List.generate(11, (index) => index);
  late int firstSummand = numbers[random.nextInt(numbers.length)];
  late int secondSummand;
  late int result;

  Exercise.correct() {
    _randomizeCorrectExercise();
  }

  Exercise.wrong() {
    _randomizeWrongExercise();
  }

  void _randomizeCorrectExercise() {
    numbers.removeWhere((element) => (firstSummand + element) > 10);
    secondSummand = numbers[random.nextInt(numbers.length)];
    result = firstSummand + secondSummand;
    term = '$firstSummand + $secondSummand = $result';
    isTrue = true;
  }

  void _randomizeWrongExercise() {
    List<int> possibleNumbers = numbers;
    possibleNumbers.removeWhere((element) => (firstSummand + element) > 10);
    secondSummand = possibleNumbers[random.nextInt(possibleNumbers.length)];

    result = numbers[random.nextInt(numbers.length)];
    while(result == firstSummand + secondSummand) {
      result = numbers[random.nextInt(numbers.length)];
    }
    term = '$firstSummand + $secondSummand = $result';
    isTrue = false;
  }

  @override
  String toString() {
    return 'Term: $term, Label: $isTrue';
  }
}

