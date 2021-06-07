import 'package:app/route_names.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ColorBlindnessTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Sehtest'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              Placeholder(),
              SizedBox(height: 24,),
              SendDataButton(navigationRoute: finalScreen),
            ],
          ),
        ),
      ),
    );
  }
}
