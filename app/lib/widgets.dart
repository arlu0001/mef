import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  CustomText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String navigationRoute;
  final bool isComplete;
  final String btnName;

  NavigationButton({
    required this.navigationRoute,
    this.btnName = 'Weiter',
    this.isComplete = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (isComplete)
          Navigator.pushNamed(context, navigationRoute);
        else {
          final snackBar = SnackBar(content: Text('Bitte füllen Sie alles aus!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Text(
        btnName,
        textAlign: TextAlign.center,
      ),
    );
  }
}
