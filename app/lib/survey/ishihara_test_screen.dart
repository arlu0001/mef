import 'package:app/api/google_sheet_api.dart';
import 'package:app/route_names.dart';
import 'package:app/survey/survey_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IshiharaTestScreen extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();

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
              Text("Welche Zahl erkennen Sie?", style: TextStyle(fontWeight: FontWeight.bold),),
              Consumer<SurveyState>(
                builder: (context, value, child) => Image.asset(
                  'assets/images/ishihara_${value.currentIshihara}.jpg',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: _editingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Eingabe',
                  hintText: 'keine'
                ),
              ),
              Text('(Lassen Sie das Feld leer, wenn Sie keine Zahl erkennen.)'),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<SurveyState>(
                  builder: (context, value, child) {
                    if (value.currentCounter < value.ishiharaImageNames.length) {
                      return OutlinedButton(
                        child: Text("Weiter"),
                        onPressed: () {
                          if(_editingController.text.isEmpty) {
                            context.read<SurveyState>().setIshiharaResult('keine');
                          } else {
                            context.read<SurveyState>().setIshiharaResult(_editingController.text);
                          }
                          _editingController.clear();
                        },
                      );
                    } else {
                      return OutlinedButton(
                        onPressed: () {
                          if(_editingController.text.isEmpty) {
                            context.read<SurveyState>().setIshiharaResult('keine');
                          } else {
                            context.read<SurveyState>().setIshiharaResult(_editingController.text);
                          }
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

                          Navigator.pushNamed(context, finalRoute);
                        },
                        child: Text('Absenden'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
