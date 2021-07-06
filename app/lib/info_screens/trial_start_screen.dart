import 'package:app/route_names.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class TrialStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              CustomText(text: 'Starten Sie das Experiment, sobald Sie bereit sind.'),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NavigationButton(
                  navigationRoute: trialRoute,
                  btnName: 'Start',
                  isComplete: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
