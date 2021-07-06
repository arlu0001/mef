import 'package:flutter/material.dart';

import '../route_names.dart';
import '../widgets.dart';

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
            CustomText(
                text:
                    'Vielen Dank, dass Sie sich bereit erklären, an dieser Studie teilzunehmen.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Dauer des Versuchs: 4 - 6 Minuten'),
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
                navigationRoute: survey1Route,
                isComplete: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
