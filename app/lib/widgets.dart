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
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String navigationRoute;

  NavigationButton({required this.navigationRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, navigationRoute),
      child: Text('Weiter'),
    );
  }

}
