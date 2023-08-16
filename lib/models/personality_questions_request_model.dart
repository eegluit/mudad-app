class PersonalityQuestionsRequestModel {
  String userId;
  List<int> conscientiousness;
  List<int> neuroticism;
  List<int> financialSelfEfficacy;
  List<int> socialSupport;

  PersonalityQuestionsRequestModel({
    required this.userId,
    required this.conscientiousness,
    required this.neuroticism,
    required this.financialSelfEfficacy,
    required this.socialSupport,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'Conscientiousness': conscientiousness,
      'Neuroticism': neuroticism,
      'FinancialSelfEfficacy': financialSelfEfficacy,
      'SocialSupport': socialSupport,
    };
  }
}