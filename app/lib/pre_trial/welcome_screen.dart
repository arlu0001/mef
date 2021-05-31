import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(text: 'Wir sind Studierende im Master Informatik. Diese Studie wird im Rahmen der Lehrveranstaltung “Methoden der empirischen Forschung” an der Hochschule Kaiserslautern durchgeführt.'),
              CustomText(text: 'Die Studie beschäftigt sich mit der Reaktionszeit auf verschiedenen Benutzeroberflächen.'),
              CustomText(text: 'Demographische Werte werden anonymisiert bewertet.'),
              CustomText(text: 'Vielen Dank, dass Sie sich bereit erklären, an der Studie teilzunehmen.'),
              CustomText(text: 'Dauer des Versuchs: x Minuten'),
              NavigationButton(navigationRoute: surveyScreen1),
            ],
          ),
        ),
      ),
    );
  }
}
