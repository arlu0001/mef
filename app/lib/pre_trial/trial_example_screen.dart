import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TrialExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Versuchsdurchführung'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Placeholder(),
            SizedBox(height: 24,),
            NavigationButton(navigationRoute: trialScreen, isComplete: true,),
          ],
        ),
      ),
    );
  }
}