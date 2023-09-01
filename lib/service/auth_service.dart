import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mudad/widget/log_print/log_print_condition.dart';
import '../models/auth_response_model.dart';
import '../models/sign_up_request_model.dart';
import '../models/user_model.dart';
import '../utils/constant/constant.dart';
import '../model/models/dashboard_model/get_user_profile_details.dart';

class AuthService {
  Future<AuthResponseModel> signUp(
      String name, String email, String password) async {
    SignUpRequestModel requestModel = SignUpRequestModel(
      name: name,
      email: email,
      password: password,
    );
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.signUp}',
        data: requestModel,
        options: Options(
          headers: {"Content-Type": "application/json; charset=utf-8"},
        ),
      );

      AuthResponseModel model = AuthResponseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        AuthResponseModel model = AuthResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AuthResponseModel model = AuthResponseModel(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AuthResponseModel model = AuthResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
      // debugPrint('dio error: ${e.message}');
      // AuthResponseModel model = AuthResponseModel(
      //   message: e.message,
      //   code: 400,
      // );
      // return model;
    } on SocketException catch (e) {
      AuthResponseModel model = AuthResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<AuthResponseModel> login(String email, String password) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.login}',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      AuthResponseModel model = AuthResponseModel.fromJson(response.data);
      model.code = response.statusCode;
      print("email asa ${response.statusCode}");
      return model;
    } on DioError catch (e) {
      print("login error ${e.response!} ada");
      if (e.type == DioErrorType.response) {
        AuthResponseModel model = AuthResponseModel.fromJson(e.response!.data);
        model.code = e.response!.statusCode;
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AuthResponseModel model = AuthResponseModel(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AuthResponseModel model = AuthResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
      // debugPrint('dio error: ${e.message}');
      // AuthResponseModel model = AuthResponseModel(
      //   message: e.message,
      //   code: 400,
      // );
      // return model;
    } on SocketException catch (e) {
      AuthResponseModel model = AuthResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<UserModel> otpVerify(String otp, String token) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.verifyOtp}',
        data: {
          'otp': otp,
        },
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {'authentication': 'Bearer $token'}),
      );
      print("ABC ${response.data.toString()}");
      logPrint(response.data);
      UserModel model = UserModel.fromJson(response.data);
      print("ABCD ${model.toJson()}");
      return model;
    } on DioError catch (e) {
      logPrint(e.response!.statusCode);
      logPrint(e.response!.data);
      if (e.type == DioErrorType.response) {
        UserModel model = UserModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        UserModel model = UserModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        UserModel model = UserModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
      // debugPrint('dio error: ${e.message}');
      // UserModel model = UserModel(
      //   message: e.message,
      //   code: 400,
      // );
      // return model;
    } on SocketException catch (e) {
      UserModel model = UserModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<AuthResponseModel> forgetPassword(String email) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.forgetPassword}',
        data: {
          'email': email,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      AuthResponseModel model = AuthResponseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        AuthResponseModel model = AuthResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AuthResponseModel model = AuthResponseModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AuthResponseModel model = AuthResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
      // debugPrint('dio error: ${e.message}');
      // AuthResponseModel model = AuthResponseModel(
      //   message: e.message,
      //   code: 400,
      // );
      // return model;
    } on SocketException catch (e) {
      AuthResponseModel model = AuthResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<AuthResponseModel> otpVerifyForget(String otp, String token) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.verifyForgetOtp}',
        data: {
          'otp': otp,
        },
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {'authentication': 'Bearer $token'}),
      );
      AuthResponseModel model = AuthResponseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        AuthResponseModel model = AuthResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AuthResponseModel model = AuthResponseModel(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AuthResponseModel model = AuthResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
      // debugPrint('dio error: ${e.message}');
      // AuthResponseModel model = AuthResponseModel(
      //   message: e.message,
      //   code: 400,
      // );
      // return model;
    } on SocketException catch (e) {
      AuthResponseModel model = AuthResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<AuthResponseModel> resetPassword(String password, String token) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.resetPassword}',
        data: {
          'password': password,
        },
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {'authentication': 'Bearer $token'}),
      );
      AuthResponseModel model = AuthResponseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        AuthResponseModel model = AuthResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AuthResponseModel model = AuthResponseModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AuthResponseModel model = AuthResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
      // debugPrint('dio error: ${e.message}');
      // AuthResponseModel model = AuthResponseModel(
      //   message: e.message,
      //   code: 400,
      // );
      // return model;
    } on SocketException catch (e) {
      AuthResponseModel model = AuthResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<GetUserProfileDetails> getDashboardUserDetails(
      String authToken) async {
    try {
      var response = await Dio().get(
        '${Constant.baseUrl}${Constant.baseURLUpdated}',
        options: Options(
          headers: {'Authentication': 'Bearer $authToken'},
        ),
      );
      GetUserProfileDetails model =
          GetUserProfileDetails.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetUserProfileDetails model =
            GetUserProfileDetails.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetUserProfileDetails model = GetUserProfileDetails(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetUserProfileDetails model = GetUserProfileDetails(
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetUserProfileDetails model = GetUserProfileDetails(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }
}
