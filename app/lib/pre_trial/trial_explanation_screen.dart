import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TrialExplanationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Versuchsdurchführung'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              CustomText(
                  text:
                      'Sie erhalten im folgenden mehrere Rechenaufgaben und Sie sollen auswählen, ob die Aufgabe richtig oder falsch gelöst wurde. '),
              SizedBox(
                height: 16,
              ),
              CustomText(
                  text:
                      'Um in den Versuch einzuführen erhalten Sie eine Übungsaufgabe, die die Aufgabenstellung verdeutlicht.'),
              SizedBox(
                height: 24,
              ),
              Center(
                  child: NavigationButton(
                navigationRoute: trialExampleScreen,
                isComplete: true,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
