import 'package:app/trial/trial_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TrialState>(
          builder: (BuildContext context, value, Widget? child) {
            return Text(
              'Aufgabe ${value.currentExerciseCounter}/${value.exercises.length}',
            );
          },
        ),
      ),
      body: Center(
        child: Consumer<TrialState>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${value.currentExercise.term}',
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(
                height: 100,
              ),
              TrialButton(
                buttonTitle: value.currentButtonConfig.buttonTitle1,
                buttonBackgroundColor: value.currentButtonConfig.buttonBackgroundColor1,
              ),
              SizedBox(
                height: 8,
              ),
              TrialButton(
                buttonTitle: value.currentButtonConfig.buttonTitle2,
                buttonBackgroundColor: value.currentButtonConfig.buttonBackgroundColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrialButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonBackgroundColor;

  TrialButton({required this.buttonTitle, required this.buttonBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<TrialState>().loadExercise();
        context.read<TrialState>().loadButtonConfig();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(buttonTitle),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonBackgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 24)),
      ),
    );
  }
}
