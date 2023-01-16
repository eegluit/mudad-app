import 'package:dio/dio.dart';
import '../../../widget/log_print/log_print_condition.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint("--> ${options.method} ${options.path}");
    logPrint("Headers: ${options.headers.toString()}");
    logPrint("<-- END HTTP");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint("<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {endingIndex = responseAsString.length;}
        logPrint(responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      logPrint(response.data);
    }
    logPrint("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
