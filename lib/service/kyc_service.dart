import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mudad/models/kyc_upload_doc_response_model.dart';
import 'package:mudad/models/kyc_upload_selfie_response_model.dart';
import 'package:mudad/widget/log_print/log_print_condition.dart';
import '../utils/constant/constant.dart';
import '../models/kyc_id_type_request_model.dart';
import '../models/kyc_id_type_response_model.dart';
import '../models/upload_profile_selfie_response_model.dart';
import '../models/get_kyc_details_response_model.dart';
import '../models/get_profile_selfie_response_model.dart';

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
          //message: "Oops! Something went wrong.",
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        KycIdTypeResponseModel model = KycIdTypeResponseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      KycIdTypeResponseModel model = KycIdTypeResponseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<KycUploadDocResponseModel> submitKycDoc(
      Map<String, dynamic> kycIdFile, File imageFile, String token) async {
    logPrint(" ${jsonEncode(kycIdFile)}");

    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycUploadDoc}',
        data: {
          'document': jsonEncode(kycIdFile),
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
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
          //message: "Oops! Something went wrong.",
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        KycUploadDocResponseModel model = KycUploadDocResponseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      KycUploadDocResponseModel model = KycUploadDocResponseModel(
        message: "Oops! Something went wrong.",
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
          contentType: Headers.formUrlEncodedContentType,
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
          //message: "Oops! Something went wrong.",
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        KycUploadSelfieResponseModel model = KycUploadSelfieResponseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      KycUploadSelfieResponseModel model = KycUploadSelfieResponseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<UploadProfileSelfieResponseModel> uploadProfileSelfie(
      File selfieFile, String userID, String authToken) async {
    try {
      String fileName = selfieFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'profilePicture': await MultipartFile.fromFile(
          selfieFile.path,
          filename: fileName,
          contentType: MediaType('image', 'jpg'),
        ),
        'UserId': userID
      });
      var response = await Dio().post(
        '${Constant.baseURLUpdated}${Constant.profilePicture}',
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'x-functions-key': authToken},
        ),
      );
      UploadProfileSelfieResponseModel model =
          UploadProfileSelfieResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      log("DioError ${e.response!.data}");
      if (e.type == DioErrorType.response) {
        UploadProfileSelfieResponseModel model =
            UploadProfileSelfieResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        UploadProfileSelfieResponseModel model =
            UploadProfileSelfieResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        UploadProfileSelfieResponseModel model =
            UploadProfileSelfieResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      UploadProfileSelfieResponseModel model = UploadProfileSelfieResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GetKycDetailsResponseModel> getKycDetails(
      String userID, String token) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.kycGetDetails}',
        data: {
          'userId': userID,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      GetKycDetailsResponseModel model =
          GetKycDetailsResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetKycDetailsResponseModel model =
            GetKycDetailsResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetKycDetailsResponseModel model = GetKycDetailsResponseModel(
          //message: "Oops! Something went wrong.",
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetKycDetailsResponseModel model = GetKycDetailsResponseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetKycDetailsResponseModel model = GetKycDetailsResponseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GetProfileSelfieResponseModel> getProfilePicture(
      String token, String userID) async {
    try {
      var response = await Dio().get(
        '${Constant.baseURLUpdated}${Constant.profilePicture}/${userID}',
        options: Options(
          headers: {'x-functions-key': token},
        ),
      );
      GetProfileSelfieResponseModel model =
          GetProfileSelfieResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetProfileSelfieResponseModel model =
            GetProfileSelfieResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetProfileSelfieResponseModel model = GetProfileSelfieResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetProfileSelfieResponseModel model = GetProfileSelfieResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetProfileSelfieResponseModel model = GetProfileSelfieResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
