import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SurveyScreen1 extends StatelessWidget {
  var biologicalSex;
  var age;

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
            RadioListTile(
              value: 'Weiblich',
              groupValue: biologicalSex,
              onChanged: (value) => null,
              title: Text('Weiblich'),
            ),
            RadioListTile(
              value: 'Männlich',
              groupValue: biologicalSex,
              onChanged: (value) => null,
              title: Text('Männlich'),
            ),
            Text(
              'Wie alt sind Sie?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: '11-20',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('11-20'),
            ),
            RadioListTile(
              value: '21-30',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('21-30'),
            ),
            RadioListTile(
              value: '31-40',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('31-40'),
            ),
            RadioListTile(
              value: '41-50',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('41-50'),
            ),
            RadioListTile(
              value: '51-60',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('51-60'),

            ),
            RadioListTile(
              value: '61-70',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('61-70'),
            ),
            RadioListTile(
              value: '71-80',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('71-80'),
            ),
            RadioListTile(
              value: '81-90',
              groupValue: age,
              onChanged: (value) => null,
              title: Text('81-90'),
            ),
            Center(child: NavigationButton(navigationRoute: surveyScreen2)),
          ],
        ),
      ),
    );
  }
}
