class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance => _instance ??= AppConstants._init();
  AppConstants._init();

  ///Mobil Language
  String get mobileLanguage => "en_Us";

  ///default theme
  String get defaultTheme => "light";

  /// base url
  String get baseUrl =>
      'http://ec2-13-127-138-135.ap-south-1.compute.amazonaws.com:8081/v1/';

  String get imageUrl =>
      'http://ec2-13-127-138-135.ap-south-1.compute.amazonaws.com:8081/static/docs/';

  String get baseURLCreditModule =>
      'https://madadcreditscore.azurewebsites.net/api/CreditScore/';
}
