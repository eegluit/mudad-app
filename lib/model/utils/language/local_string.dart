import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
        },

        'hi_IN': {
          'hello': 'नमस्ते',
        }
      };
}
