import 'package:app/post_trial/survey_state.dart';
import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveyScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Daten zur Person 2/2'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          children: [
            Text(
              'Wie häufig nutzen Sie ein Smartphone?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'mehrmals täglich',
                groupValue: value.smartphoneUsage,
                onChanged: (value) => context.read<SurveyState>().setSmartphoneUsage(value!),
                title: Text('mehrmals täglich'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'täglich',
                groupValue: value.smartphoneUsage,
                onChanged: (value) => context.read<SurveyState>().setSmartphoneUsage(value!),
                title: Text('täglich'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'mehrmals die Woche',
                groupValue: value.smartphoneUsage,
                onChanged: (value) => context.read<SurveyState>().setSmartphoneUsage(value!),
                title: Text('mehrmals die Woche'),
              ),
            ),
            Text(
              'Wie sicher fühlen Sie sich bei der Bedienung?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'sehr sicher',
                groupValue: value.usageConfidence,
                onChanged: (value) => context.read<SurveyState>().setUsageConfidence(value!),
                title: Text('sehr sicher'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'sicher',
                groupValue: value.usageConfidence,
                onChanged: (value) => context.read<SurveyState>().setUsageConfidence(value!),
                title: Text('sicher'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'mittelmäßig',
                groupValue: value.usageConfidence,
                onChanged: (value) => context.read<SurveyState>().setUsageConfidence(value!),
                title: Text('mittelmäßig'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'unsicher',
                groupValue: value.usageConfidence,
                onChanged: (value) => context.read<SurveyState>().setUsageConfidence(value!),
                title: Text('unsicher'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'sehr unsicher',
                groupValue: value.usageConfidence,
                onChanged: (value) => context.read<SurveyState>().setUsageConfidence(value!),
                title: Text('sehr unsicher'),
              ),
            ),
            Center(
                child: NavigationButton(
              navigationRoute: trialExplanationScreen,
              isComplete: (context.watch<SurveyState>().smartphoneUsage != '' &&
                  context.watch<SurveyState>().usageConfidence != ''),
            )),
          ],
        ),
      ),
    );
  }
}
