function myFunction() {
// Generate first row with column name. Only use once on new sheet
   /*var sheet = SpreadsheetApp.openById("id_of_sheet");
   var columnNames = ["Datum", "Uhrzeit", "Geschlecht", "Alter", "OS", "Smartphone Nutzung", "Smartphone Nutzungserfahrung", "Zeit gesamt", "Richtig", "Falsch", "Ishihara 42", "Ishihara 3", "Ishihara Linien", "Ishihara Dauer"];
   for(i = 1; i <= 100; i++) {
    columnNames.push('Z' + i, 'R' + i);
   }
   sheet.appendRow(columnNames);*/
}

function doPost(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("id_of_sheet");
  var result = {"status": "SUCCESS"};
  try{
    // Get all Parameters
    var biologicalSex = request.parameter.biologicalSex;
    var age = request.parameter.age;
    var os = request.parameter.os;
    var smartphoneUsage = request.parameter.smartphoneUsage;
    var usageConfidence = request.parameter.usageConfidence
    var correctAnsweredCount = request.parameter.correctAnsweredCount;
    var falseAnsweredCount = request.parameter.falseAnsweredCount;
    var ishiharaTestResult3 = request.parameter.ishiharaTestResult3;
    var ishiharaTestResult42 = request.parameter.ishiharaTestResult42;
    var ishiharaTestResultLines = request.parameter.ishiharaTestResultLines;
    var ishiharaTestDuration = request.parameter.ishiharaTestDuration;
    var date = request.parameter.date;
    var time = request.parameter.time;
    var totalTrialTime = request.parameter.totalTrialTime;
    var times = request.parameter.times.split(";");
    var reactions = request.parameter.reactions.split(";");

    var results = [
      date,
      time,
      biologicalSex, 
      age,
      os,
      smartphoneUsage,
      usageConfidence,
      totalTrialTime,
      correctAnsweredCount,
      falseAnsweredCount,
      ishiharaTestResult3,
      ishiharaTestResult42,
      ishiharaTestResultLines,
      ishiharaTestDuration
    ]
      
    for(i = 0; i < times.length; i++) {
      results.push(times[i], reactions[i]);
    }
      
    // Append data on Google Sheet
    var rowData = sheet.appendRow(results);
    

  }catch(exc){
    // If error occurs, throw exception
    result = {"status": "FAILED", "message": exc};
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(result))
  .setMimeType(ContentService.MimeType.JSON);
}