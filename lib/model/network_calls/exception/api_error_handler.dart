
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../page/auth_page/sign_in_page.dart';
import '../../../widget/log_print/log_print_condition.dart';
import '../../models/network_call_model/error_response.dart';
import '../../services/auth_service.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              errorDescription = "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 401:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription = error.response!.data['message'] ?? "Failed to load data - status code: ${error.response!.statusCode}";
                  }
                  if (error.response!.data['message'] == "SESSION_EXPIRED" || error.response!.data['message'] == "LOGGED_OUT") {
                    Get.offAllNamed(SignInPage.route);
                    Get.find<AuthService>().logOut();
                  }
                  break;
                case 422:
                  logPrint(error.response!.data['message']);
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription = error.response!.data['message'] ?? "Failed to load data - status code: ${error.response!.statusCode}";
                  }
                  break;
                case 503:
                  errorDescription = error.response!.statusMessage;
                  break;
                default:
                  logPrint("this is error response ${error.response!.data}");
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.errors != null &&
                      errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription = error.response!.data['message'] ?? "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
