import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mudad/models/send_card_otp_response_model.dart';
import 'package:mudad/models/default_response_model.dart';
import '../utils/constant/constant.dart';

class CardService {
  Future<CardVerificationResponseModel> addCardForUser(
      String cardNum,
      String expMonth,
      String expYear,
      String cvv,
      String cardHolderName,
      String userID) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.verifyCardOtp}${userID}',
        data: {
          'payObject': {
            'secCard': cardNum,
            'secExpMon': expMonth,
            'secExpYear': expYear,
            'secCvv': cvv,
            'cardName': cardHolderName,
            'orderId': userID,
            'amount': '0.200'
          }
        },
        options: Options(
          contentType: Headers.textPlainContentType,
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA==',
            'Content-Type': 'application/json'
          },
        ),
      );
      print("ABC 02 ${response}");
      CardVerificationResponseModel model =
          CardVerificationResponseModel.fromJson(response.data);
      model.code = 200;
      print('ABC 03 ${model}');
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        CardVerificationResponseModel model = CardVerificationResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        CardVerificationResponseModel model = CardVerificationResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        CardVerificationResponseModel model = CardVerificationResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      CardVerificationResponseModel model = CardVerificationResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<DefaultResponseModel> verifyOtpForUser(
      String otp, String userID, String paymentID) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.addCard}${userID}',
        data: {
          'payObject': {
            'secOtp': otp,
            'paymentId': paymentID,
            'orderId': userID
          }
        },
        options: Options(
          contentType: Headers.textPlainContentType,
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA==',
            'Content-Type': 'application/json'
          },
        ),
      );
      print("ABC 02 ${response}");
      DefaultResponseModel model = DefaultResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        DefaultResponseModel model = DefaultResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        DefaultResponseModel model = DefaultResponseModel(
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        DefaultResponseModel model = DefaultResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      DefaultResponseModel model = DefaultResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
