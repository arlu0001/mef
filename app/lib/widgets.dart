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
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String navigationRoute;
  bool isComplete;

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

class SendDataButton extends StatelessWidget {
  final String navigationRoute;

  SendDataButton({required this.navigationRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        GoogleSheetApi api = GoogleSheetApi();
        api.prepareResult();
        api.submitForm((String response) {
          print("Response: $response");
          if (response == GoogleSheetApi.STATUS_SUCCESS) {
            // Feedback is saved succesfully in Google Sheets.
            print("Feedback Submitted");
          } else {
            // Error Occurred while saving data in Google Sheets.
            print("Error Occurred!");
          }
        });
        Navigator.pushNamed(context, navigationRoute);
      },
      child: Text('Absenden'),
    );
  }

}
