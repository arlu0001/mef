import 'package:flutter/material.dart';

import '../route_names.dart';
import '../widgets.dart';

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
                      'Sie erhalten im Experiment einfache Rechenaufgaben, die schon gelöst worden sind (siehe Beispielaufgabe). Sie sollen entscheiden, ob die Aufgaben richtig oder falsch gelöst worden sind. Das tun Sie, indem Sie so schnell wie möglich einen der beiden Buttons antippen. Insgesamt werden Sie 100 Aufgaben bewerten. Bitte suchen Sie einen ruhigen Ort auf, an dem Sie das Experiment durchführen können.'),
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
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
