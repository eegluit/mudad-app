
import 'package:flutter/foundation.dart';

void logPrint(var message){
  if (kDebugMode) {
    print(message.toString());
  }
}