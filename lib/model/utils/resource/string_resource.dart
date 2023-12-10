class StringResource {
  static StringResource? _instance;

  static StringResource get instance => _instance ??= StringResource._init();

  StringResource._init();

  String get currentUser => 'currentUser';
  String get isFirst => 'isFirst';
  String get isPermission => 'isPermission';
  String get loginKey => "isLoggedIn";
  String get remember => "remember";
  String get token => "token";
  String get userID => "userID";
  String get isKyc => "isKyc";
  String get availableCredit => "availableCredit";
  String get isCreditScoreCalc => "isCreditScoreCalc";
  String get creditScore => "creditScore";
}
