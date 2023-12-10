import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mudad/models/get_dashboard_data_response_model.dart';
import '../utils/constant/constant.dart';
import 'package:get_storage/get_storage.dart';


class SplashService {
  Future<GetDashboardDataResponseModel> getDashboardData(String userID) async {
    print("MNO ${userID}");
    try {
      var response = await Dio().get(
        '${Constant.baseURLLMS}${Constant.getDashboardData}$userID',
        options: Options(
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA=='
          },
        ),
      );
      print("MNO ${response.data}");
      GetDashboardDataResponseModel model =
          GetDashboardDataResponseModel.fromJson(response.data);
      print("MNO ${model}");
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetDashboardDataResponseModel model =
            GetDashboardDataResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetDashboardDataResponseModel model = GetDashboardDataResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetDashboardDataResponseModel model = GetDashboardDataResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetDashboardDataResponseModel model = GetDashboardDataResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
