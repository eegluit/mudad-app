import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mudad/models/get_trasactions_list_reaponse_model.dart';
import '../utils/constant/constant.dart';

class TransactionService {
  Future<GetTransactionResponseModel> getTransactionList(String userID) async {
    try {
      var response = await Dio().get(
        '${Constant.baseURLLMS}${Constant.getTransaction}/$userID',
        options: Options(
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA=='
          },
        ),
      );
      print("ABCD00 ${response.data}");
      GetTransactionResponseModel model =
          GetTransactionResponseModel.fromJson(response.data);
      print("ABCD01 ${model}");
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetTransactionResponseModel model =
            GetTransactionResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetTransactionResponseModel model = GetTransactionResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetTransactionResponseModel model = GetTransactionResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetTransactionResponseModel model = GetTransactionResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
