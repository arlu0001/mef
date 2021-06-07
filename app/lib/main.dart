import 'package:app/survey/color_blindness_test_screen.dart';
import 'package:app/survey/survey_screen_1.dart';
import 'package:app/survey/survey_screen_2.dart';
import "package:universal_html/html.dart";
import 'package:app/info_screens/final_screen.dart';
import 'package:app/route_names.dart';
import 'package:app/trial/trial_screen.dart';
import 'package:app/trial/trial_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'info_screens/trial_example_screen.dart';
import 'info_screens/welcome_screen.dart';
import 'survey/survey_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SurveyState surveyState = SurveyState();
  final userAgent = window.navigator.userAgent.toString().toLowerCase();

  @override
  Widget build(BuildContext context) {
    if (userAgent.contains('iphone') || userAgent.contains('ipad') || userAgent.contains('android')) {
    return MaterialApp(
      initialRoute: welcomeScreen,
      routes: {
        welcomeScreen: (context) => WelcomeScreen(),
        surveyScreen1: (context) => ChangeNotifierProvider<SurveyState>(
              create: (_) => surveyState,
              child: SurveyScreen1(),
            ),
        surveyScreen2: (context) => ChangeNotifierProvider<SurveyState>(
              create: (_) => surveyState,
              child: SurveyScreen2(),
            ),
        trialExampleScreen: (context) => TrialExampleScreen(),
        trialScreen: (context) => ChangeNotifierProvider<TrialState>(
              create: (_) => TrialState(),
              child: TrialScreen(),
            ),
        colorBlindnessTestScreen: (context) => ColorBlindnessTestScreen(),
        finalScreen: (context) => FinalScreen(),
      },
    );
    } else {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Dieses Experiment untersucht das Nutzerverhalten auf Smartphones. \nBitte rufen Sie diesen Link auf einem Smartphone auf, welches Android oder IOS als Betriebssystem nutzt. \nVielen Dank für Ihr Verständnis!',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }
}
