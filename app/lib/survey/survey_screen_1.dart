
import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'survey_state.dart';

class SurveyScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Daten zur Person 1/2'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          children: [
            Text(
              'Was ist Ihr biologisches Geschlecht?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'f',
                groupValue: value.biologicalSex,
                onChanged: (value) => context.read<SurveyState>().setBiologicalSex(value!),
                title: Text('Weiblich'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'm',
                groupValue: value.biologicalSex,
                onChanged: (value) => context.read<SurveyState>().setBiologicalSex(value!),
                title: Text('Männlich'),
              ),
            ),
            Text(
              'Wie alt sind Sie?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'unter 11',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('unter 11'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '11-20',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('11-20'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '21-30',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('21-30'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '31-40',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('31-40'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '41-50',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('41-50'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '51-60',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('51-60'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'über 60',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('über 60'),
              ),
            ),
            Center(
              child: NavigationButton(
                navigationRoute: surveyScreen2,
                isComplete:
                    (context.watch<SurveyState>().biologicalSex != '' && context.watch<SurveyState>().age != ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
