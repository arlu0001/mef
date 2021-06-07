import 'package:app/api/google_sheet_api.dart';
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

  NavigationButton({required this.navigationRoute, this.isComplete = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(isComplete)
          Navigator.pushNamed(context, navigationRoute);
        else
          return null;
      },
      child: Text('Weiter'),
    );
  }

}