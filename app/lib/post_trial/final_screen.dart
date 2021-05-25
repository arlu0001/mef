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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text: 'Ihre Testergebnisse wurden anonymisiert versendet!'),
                CustomText(text: 'Vielen Dank für Ihre Teilnahme!'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
