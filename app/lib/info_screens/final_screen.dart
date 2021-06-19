import 'package:flutter/material.dart';

import '../widgets.dart';

class FinalScreen extends StatelessWidget {
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
              CustomText(text: 'Ihre Testergebnisse wurden anonymisiert versendet!'),
              SizedBox(height: 16,),
              CustomText(text: 'Vielen Dank für Ihre Teilnahme!'),
            ],
          ),
        ),
      ),
    );
  }
}
