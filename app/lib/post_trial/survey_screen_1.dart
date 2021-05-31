import 'package:app/post_trial/survey_state.dart';
import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveyScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Abschlussbefragung'),
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
                value: 'Weiblich',
                groupValue: value.biologicalSex,
                onChanged: (value) => context.read<SurveyState>().setBiologicalSex(value!),
                title: Text('Weiblich'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: 'Männlich',
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
                value: '61-70',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('61-70'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '71-80',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('71-80'),
              ),
            ),
            Consumer<SurveyState>(
              builder: (context, value, child) => RadioListTile<String?>(
                value: '81-90',
                groupValue: value.age,
                onChanged: (value) => context.read<SurveyState>().setAge(value!),
                title: Text('81-90'),
              ),
            ),
            Center(child: NavigationButton(navigationRoute: surveyScreen2)),
          ],
        ),
      ),
    );
  }
}
