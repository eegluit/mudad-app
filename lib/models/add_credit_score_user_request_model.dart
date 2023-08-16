
class AddCreditScoreUserRequestModel {
  String firstName;
  String lastName;
  String gender;
  String dob;
  String profession;
  String employer;
  String employerAddress;
  int monthlyIncome;

  AddCreditScoreUserRequestModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.profession,
    required this.employer,
    required this.employerAddress,
    required this.monthlyIncome,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dob': dob,
      'profession': profession,
      'employer': employer,
      'employerAddress': employerAddress,
      'monthlyIncome': monthlyIncome,
    };
  }
}
