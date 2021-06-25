import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TrialExampleScreen extends StatelessWidget {
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
                      'Sie erhalten im Experiment einfache Rechen-\naufgaben, die schon gelöst worden sind (siehe Beispielaufgabe). Sie sollen entscheiden, ob die Aufgaben richtig oder falsch gelöst worden sind. Das tun Sie, indem Sie so schnell wie möglich einen der beiden Buttons antippen. Insgesamt werden Sie 100 Aufgaben bewerten. Bitte suchen Sie einen ruhigen Ort auf, an dem Sie das Experiment durchführen können.'),
              SizedBox(
                height: 8,
              ),
              Text(
                'Bild: Beispielaufgabe',
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: Colors.black,
                )),
                child: Image.asset('assets/images/trial_example_blue.jpg'),
              ),
              Text(
                'Bild: Beispielaufgabe',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: NavigationButton(
                  navigationRoute: startTrialRoute,
                  isComplete: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
