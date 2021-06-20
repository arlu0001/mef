import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            CustomText(
                text:
                    'Wir, Ariel, Emira und Kim, sind Studierende im Master Informatik und beschäftigen uns mit der Forschung zur Benutzung verschiedener Benutzeroberflächen. Die Forschung erfolgt als Prüfungsleistung des Moduls “Methoden der empirischen Forschung”.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Daten zu Ihrer Person werden anonymisiert.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Vielen Dank, dass Sie sich bereit erklären, an dieser Studie teilzunehmen.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Dauer des Versuchs: 4 - 6 Minuten'),
            SizedBox(
              height: 24,
            ),
            Center(
                child: NavigationButton(
              navigationRoute: survey1Route,
              isComplete: true,
            )),
          ],
        ),
      ),
    );
  }
}
