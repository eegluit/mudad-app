import 'dart:io';
import 'package:dio/dio.dart';
import '../utils/constant/constant.dart';
import '../models/kyc_id_type_request_model.dart';
import '../models/kyc_id_type_response_model.dart';

class KycService {
  Future<KycIdTypeResponseModel> submitKycIdType(
      String kycIdType, String token) async {
    print("ABC123");
    KycIdTypeRequestModel requestModel =
        KycIdTypeRequestModel(kycIdType: kycIdType);
    try {
      print("ABC124");
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycAddIdType}',
        data: requestModel,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      print("ABC124,${response}");
      KycIdTypeResponseModel model =
          KycIdTypeResponseModel.fromJson(response.data);
      print('KYC submitIdType: ${model}');
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        KycIdTypeResponseModel model =
            KycIdTypeResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        KycIdTypeResponseModel model = KycIdTypeResponseModel(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        KycIdTypeResponseModel model = KycIdTypeResponseModel(
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
      KycIdTypeResponseModel model = KycIdTypeResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }
}
