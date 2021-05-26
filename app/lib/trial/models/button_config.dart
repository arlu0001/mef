import 'dart:math';

import 'package:flutter/material.dart';

class ButtonConfig {
  late final String buttonTitle1;
  late final Color buttonBackgroundColor1;
  late final String buttonTitle2;
  late final Color buttonBackgroundColor2;

  List<String> titles = ['Richtig', 'Falsch'];
  List<Color> colors = [Colors.green, Colors.red];

  ButtonConfig() {
    _randomizeConfig();
  }

  void _randomizeConfig() {
    var random = Random();

    this.buttonTitle1 = titles[random.nextInt(titles.length)];
    this.buttonBackgroundColor1 = colors[random.nextInt(colors.length)];

    if (buttonTitle1 == titles[0])
      buttonTitle2 = titles[1];
    else
      buttonTitle2 = titles[0];

    if (buttonBackgroundColor1 == colors[0])
      buttonBackgroundColor2 = colors[1];
    else
      buttonBackgroundColor2 = colors[0];
  }
}
