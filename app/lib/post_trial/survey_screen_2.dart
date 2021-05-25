import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SurveyScreen2 extends StatelessWidget {
  var smartphoneUsage;
  var usageConfidence;

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
              'Wie häufig nutzen Sie ein Smartphone?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: 'mehrmals täglich',
              groupValue: smartphoneUsage,
              onChanged: (value) => null,
              title: Text('mehrmals täglich'),
            ),
            RadioListTile(
              value: 'täglich',
              groupValue: smartphoneUsage,
              onChanged: (value) => null,
              title: Text('täglich'),
            ),
            RadioListTile(
              value: 'mehrmals die Woche',
              groupValue: smartphoneUsage,
              onChanged: (value) => null,
              title: Text('mehrmals die Woche'),
            ),
            RadioListTile(
              value: 'wöchentlich',
              groupValue: smartphoneUsage,
              onChanged: (value) => null,
              title: Text('wöchentlich'),
            ),
            RadioListTile(
              value: 'weniger als wöchentlich',
              groupValue: smartphoneUsage,
              onChanged: (value) => null,
              title: Text('weniger als wöchentlich'),
            ),
            Text(
              'Wie sicher fühlen Sie sich bei der Bedienung?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: 'sehr sicher',
              groupValue: usageConfidence,
              onChanged: (value) => null,
              title: Text('sehr sicher'),
            ),
            RadioListTile(
              value: 'sicher',
              groupValue: usageConfidence,
              onChanged: (value) => null,
              title: Text('sicher'),
            ),
            RadioListTile(
              value: 'mittelmäßig',
              groupValue: usageConfidence,
              onChanged: (value) => null,
              title: Text('mittelmäßig'),
            ),
            RadioListTile(
              value: 'unsicher',
              groupValue: usageConfidence,
              onChanged: (value) => null,
              title: Text('unsicher'),
            ),
            RadioListTile(
              value: 'sehr unsicher',
              groupValue: usageConfidence,
              onChanged: (value) => null,
              title: Text('sehr unsicher'),

            ),
            Center(child: SendDataButton(navigationRoute: finalScreen)),
          ],
        ),
      ),
    );
  }
}
