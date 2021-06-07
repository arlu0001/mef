import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TrialExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Versuchsdurchführung'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              Image.asset('/assets/images'),
              SizedBox(
                height: 24,
              ),
              Center(
                  child: NavigationButton(
                navigationRoute: trialScreen,
                isComplete: true,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
