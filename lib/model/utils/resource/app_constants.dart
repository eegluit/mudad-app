
class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance => _instance ??= AppConstants._init();
  AppConstants._init();
  ///Mobil Language
  String get mobileLanguage => "en_Us";

  ///default theme
  String get defaultTheme => "light";

  /// base url
  String get baseUrl => 'https://admin.mudad.space/v1/';

}
