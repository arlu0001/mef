import 'package:app/info_screens/ishihara_start_screen.dart';
import 'package:app/info_screens/trial_start_screen.dart';
import 'package:app/survey/ishihara_test_screen.dart';
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

  final example = Image.asset('assets/images/trial_example_blue.jpg');
  final ishi42 = Image.asset('assets/images/ishihara_42.jpg');
  final ishi3 = Image.asset('assets/images/ishihara_3.jpg');
  final ishiLines = Image.asset('assets/images/ishihara_lines.jpg');

  @override
  Widget build(BuildContext context) {
    precacheImage(example.image, context);
    precacheImage(ishi42.image, context);
    precacheImage(ishi3.image, context);
    precacheImage(ishiLines.image, context);

    if (userAgent.contains('iphone') ||
        userAgent.contains('ipad') ||
        userAgent.contains('android')) {
      return MaterialApp(
        initialRoute: initialRoute,
        routes: {
          initialRoute: (context) => WelcomeScreen(),
          survey1Route: (context) => ChangeNotifierProvider<SurveyState>(
                create: (_) => surveyState,
                child: SurveyScreen1(),
              ),
          survey2Route: (context) => ChangeNotifierProvider<SurveyState>(
                create: (_) => surveyState,
                child: SurveyScreen2(),
              ),
          trialExampleRoute: (context) => TrialExampleScreen(),
          startTrialRoute: (context) => TrialStartScreen(),
          trialRoute: (context) => ChangeNotifierProvider<TrialState>(
                create: (_) => TrialState(),
                child: TrialScreen(),
              ),
          startIshiharaRoute: (context) => ChangeNotifierProvider<SurveyState>(
                create: (_) => surveyState,
                child: IshiharaStartScreen(),
              ),
          ishiharaTestRoute: (context) => ChangeNotifierProvider<SurveyState>(
                create: (_) => surveyState,
                child: IshiharaTestScreen(),
              ),
          finalRoute: (context) => FinalScreen(),
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
