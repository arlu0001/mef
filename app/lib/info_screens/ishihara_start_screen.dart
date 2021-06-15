import 'package:flutter/material.dart';

import '../route_names.dart';
import '../widgets.dart';

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
              Center(
                child: NavigationButton(
                  navigationRoute: ishiharaTestRoute,
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