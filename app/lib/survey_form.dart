class SurveyForm {
  String sex;
  String age;

  SurveyForm(this.sex, this.age);

  factory SurveyForm.fromJson(dynamic json) {
    return SurveyForm("${json['sex']}", "${json['age']}");
  }

  Map toJson() => {
    "sex" : sex,
    "age" : age
  };
}