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
                    'Wir sind Studierende im Master Informatik. Diese Studie wird im Rahmen der Lehrveranstaltung “Methoden der empirischen Forschung” an der Hochschule Kaiserslautern durchgeführt.'),
            SizedBox(
              height: 16,
            ),
            CustomText(
                text: 'Die Studie beschäftigt sich mit der Reaktionszeit auf verschiedenen Benutzeroberflächen.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Demographische Werte werden anonymisiert bewertet.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Vielen Dank, dass Sie sich bereit erklären, an der Studie teilzunehmen.'),
            SizedBox(
              height: 16,
            ),
            CustomText(text: 'Dauer des Versuchs: x Minuten'),
            SizedBox(
              height: 24,
            ),
            Center(
                child: NavigationButton(
              navigationRoute: surveyScreen1,
              isComplete: true,
            )),
          ],
        ),
      ),
    );
  }
}
