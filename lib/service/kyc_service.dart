import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mudad/models/kyc_upload_doc_response_model.dart';
import 'package:mudad/models/kyc_upload_selfie_response_model.dart';
import '../utils/constant/constant.dart';
import '../models/kyc_id_type_request_model.dart';
import '../models/kyc_id_type_response_model.dart';

class KycService {
  Future<KycIdTypeResponseModel> submitKycIdType(
      String kycIdType, String token) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycAddIdType}',
        data: {
          'kycIdType': kycIdType,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      KycIdTypeResponseModel model =
          KycIdTypeResponseModel.fromJson(response.data);
      model.code = 200;
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
      File kycIdFile, String token) async {
    try {
      String fileName = kycIdFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'document': await MultipartFile.fromFile(
          kycIdFile.path,
          filename: fileName,
          contentType: MediaType('image', 'jpg'),
        ),
      });
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycUploadDoc}',
        data: formData,
        options: Options(
          contentType: Headers.formDataType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      KycUploadDocResponseModel model =
          KycUploadDocResponseModel.fromJson(response.data);
      model.code = 200;
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
      File selfieFile, String token) async {
    try {
      String fileName = selfieFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'document': await MultipartFile.fromFile(
          selfieFile.path,
          filename: fileName,
          contentType: MediaType('image', 'jpg'),
        ),
      });
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycUploadSelfie}',
        data: formData,
        options: Options(
          contentType: Headers.formDataType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      KycUploadSelfieResponseModel model =
          KycUploadSelfieResponseModel.fromJson(response.data);
      model.code = 200;
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
