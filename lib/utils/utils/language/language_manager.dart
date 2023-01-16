import 'package:flutter/material.dart';

import 'local_string.dart';

class LanguageManager {

  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  final enLocale = const Locale('en', 'US');
  final hiLocale = const Locale('hi', 'IN');

  List<Locale> get supportedLocales => [enLocale, hiLocale];
  LocalString get translationLocalStrings => LocalString();

}
