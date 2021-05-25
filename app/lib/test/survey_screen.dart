import 'package:app/test/survey_form.dart';
import 'package:app/test/survey_form_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void submitSurvey() {
    SurveyForm surveyForm = SurveyForm(sexController.text, ageController.text);

    SurveyFormController surveyFormController = SurveyFormController();

    surveyFormController.submitForm(surveyForm, (String response) {
      print("Response: $response");
      if (response == SurveyFormController.STATUS_SUCCESS) {
        // Feedback is saved succesfully in Google Sheets.
        print("Feedback Submitted");
      } else {
        // Error Occurred while saving data in Google Sheets.
        print("Error Occurred!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              TextField(
                controller: sexController,
                decoration: InputDecoration(labelText: "Geschlecht"),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: "Alter"),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: () => submitSurvey(), child: Text("Abschicken")),
            ],
          ),
        ),
      ),
    );
  }
}