import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mudad/models/generate_receipt_response_model.dart';
import '../utils/constant/constant.dart';
import '../models/add_card_response_model.dart';

class CardService {
  Future<AddCardResponseModel> addCardForUser(String cardNum, String expMonth,
      String expYear, String cvv, String cardHolderName, String userID) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.addCard}${userID}',
        data: {
          'secCard': cardNum,
          'secExpMon': expMonth,
          'secExpYear': expYear,
          'secCvv': cvv,
          'cardName': cardHolderName,
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
      AddCardResponseModel model = AddCardResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        AddCardResponseModel model = AddCardResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AddCardResponseModel model = AddCardResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AddCardResponseModel model = AddCardResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      AddCardResponseModel model = AddCardResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

   Future<AddCardResponseModel> verifyOtpForUser(String otp, String userID) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.addCard}${userID}',
        data: {
          'otp': otp,
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
      AddCardResponseModel model = AddCardResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        AddCardResponseModel model = AddCardResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        AddCardResponseModel model = AddCardResponseModel(
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        AddCardResponseModel model = AddCardResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      AddCardResponseModel model = AddCardResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

}
