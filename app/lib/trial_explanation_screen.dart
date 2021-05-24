import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TrialExplanationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Versuchsdurchführung'),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(text: 'Sie erhalten im folgenden mehrere Rechenaufgaben und Sie sollen auswählen, ob die Aufgabe richtig oder falsch gelöst wurde. '),
              CustomText(text: 'Um in den Versuch einzuführen erhalten Sie eine Übungsaufgabe, die die Aufgabenstellung verdeutlicht.'),
              NavigationButton(navigationRoute: trialExampleScreen),
            ],
          ),
        ),
      ),
    );
  }
}