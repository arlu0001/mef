import 'package:app/survey/survey_state.dart';
import 'package:flutter/material.dart';

import '../route_names.dart';
import '../widgets.dart';
import 'package:provider/provider.dart';

class IshiharaStartScreen extends StatelessWidget {
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
              CustomText(text: 'Fast geschafft! \nZum Schluss erfolgt noch ein kurzer Farbsehtest. Sie erhalten 3 Bilder. Bitte schreiben Sie in das Textfeld, was Sie erkennen.'),
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
                child: OutlinedButton(
                  child: Text("Weiter"),
                  onPressed: () {
                    context.read<SurveyState>().startIshiharaStopWatch();
                    Navigator.pushNamed(context, ishiharaTestRoute);
                  },
                ),

                // NavigationButton(
                //   navigationRoute: ishiharaTestRoute,
                //   btnName: 'Start',
                //   isComplete: true,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}