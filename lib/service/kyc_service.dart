import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mudad/models/kyc_upload_doc_response_model.dart';
import 'package:mudad/models/kyc_upload_selfie_response_model.dart';
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
    } on SocketException catch (e) {
      KycIdTypeResponseModel model = KycIdTypeResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

  Future<KycUploadDocResponseModel> submitKycDoc(
      String kycIdPath, String token) async {
    print("ABC123");
    try {
      final formData = FormData.fromMap({
        'document': await MultipartFile.fromFile(kycIdPath),
      });
      print("ABC124");
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycUploadDoc}',
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      print("ABC124,${response}");
      KycUploadDocResponseModel model =
          KycUploadDocResponseModel.fromJson(response.data);
      print('KYC DOC uploaded: ${model}');
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        KycUploadDocResponseModel model =
            KycUploadDocResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        KycUploadDocResponseModel model = KycUploadDocResponseModel(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        KycUploadDocResponseModel model = KycUploadDocResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      KycUploadDocResponseModel model = KycUploadDocResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

Future<KycUploadSelfieResponseModel> submitKycSelfie(
      String selfiePath, String token) async {
    print("ABC123");
    try {
      final formData = FormData.fromMap({
        'document': await MultipartFile.fromFile(selfiePath),
      });
      print("ABC124");
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycUploadSelfie}',
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      print("ABC124,${response}");
      KycUploadSelfieResponseModel model =
          KycUploadSelfieResponseModel.fromJson(response.data);
      print('KYC DOC uploaded: ${model}');
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        KycUploadSelfieResponseModel model =
            KycUploadSelfieResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        KycUploadSelfieResponseModel model = KycUploadSelfieResponseModel(
          //message: e.message,
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        KycUploadSelfieResponseModel model = KycUploadSelfieResponseModel(
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      KycUploadSelfieResponseModel model = KycUploadSelfieResponseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }

}
