
class FontResource {
  static FontResource? _instance;

  static FontResource get instance => _instance ??= FontResource._init();

  FontResource._init();

  String get  mainFont =>   "Lato";

}