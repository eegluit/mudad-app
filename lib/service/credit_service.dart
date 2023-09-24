import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mudad/models/personality_questions_request_model.dart';
import '../models/base_model.dart';
import '../models/question_request_model.dart';
import '../utils/constant/constant.dart';
import 'package:http_parser/http_parser.dart';
import '../models/personality_test_questions_response_model.dart';
import '../models/credit_module_default_response.dart';
import '../models/add_credit_score_user_request_model.dart';
import 'package:mudad/model/services/auth_service.dart';
// import 'package:get/get.dart';

class CreditService {
  Future<BaseModel> addProfile(
    String firstName,
    String lastName,
    String gender,
    String profession,
    String employer,
    String employerAddress,
    int monthlyIncome,
    String token,
  ) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.creditAddProfile}',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'gender': gender,
          'profession': profession,
          'employer': employer,
          'employer_address': employerAddress,
          'monthly_income': monthlyIncome,
        },
        options: Options(
          headers: {'authentication': 'Bearer $token'},
        ),
      );

      BaseModel model = BaseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        BaseModel model = BaseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        BaseModel model = BaseModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        BaseModel model = BaseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<BaseModel> addQuiz(
    QuestionRequestModel requestModel,
    String token,
  ) async {
    try {
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.addQuiz}',
        data: requestModel,
        options: Options(
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      BaseModel model = BaseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        BaseModel model = BaseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        BaseModel model = BaseModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        BaseModel model = BaseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<BaseModel> getCreditScore(
    String token,
  ) async {
    try {
      var response = await Dio().get(
        '${Constant.baseUrl}${Constant.getCreditScore}',
        options: Options(
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      BaseModel model = BaseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        BaseModel model = BaseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        BaseModel model = BaseModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        BaseModel model = BaseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<BaseModel> creditUploadStatement(String token, File file) async {
    try {
      FormData formdata = FormData.fromMap({
        "statement": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'pdf'),
        ),
      });
      debugPrint('form data: ${formdata.files.toString()}');
      var response = await Dio().post(
        '${Constant.baseUrl}${Constant.creditUploadStatement}',
        data: formdata,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      BaseModel model = BaseModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        BaseModel model = BaseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        BaseModel model = BaseModel(
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        BaseModel model = BaseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GetPersonalityQuestionsResponseModel> getPersonalityTestQuestions(
      String token) async {
    try {
      var response = await Dio().get(
        '${Constant.baseURLUpdated}${Constant.personalityTest}',
        options: Options(
          headers: {'x-functions-key': token},
        ),
      );
      GetPersonalityQuestionsResponseModel model =
          GetPersonalityQuestionsResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetPersonalityQuestionsResponseModel model =
            GetPersonalityQuestionsResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetPersonalityQuestionsResponseModel model =
            GetPersonalityQuestionsResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetPersonalityQuestionsResponseModel model =
            GetPersonalityQuestionsResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetPersonalityQuestionsResponseModel model =
          GetPersonalityQuestionsResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<CreditModuleDefaultResponse> submitPersonalityQuiz(
    PersonalityQuestionsRequestModel requestModel,
    String token,
  ) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLUpdated}${Constant.personalityTest}/',
        data: requestModel.toJson(),
        options: Options(
          contentType: Headers.textPlainContentType,
          headers: {
            'x-functions-key': token,
            'Content-Type': 'application/json'
          },
        ),
      );
      CreditModuleDefaultResponse model =
          CreditModuleDefaultResponse.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        CreditModuleDefaultResponse model =
            CreditModuleDefaultResponse.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<CreditModuleDefaultResponse> submitSpendingBehavior(
      File pdfFile, String token, String userId) async {
    try {
      String fileName = pdfFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'pdfFile': await MultipartFile.fromFile(
          pdfFile.path,
          filename: fileName,
          contentType: MediaType('application', 'pdf'),
        ),
        'UserId': userId,
      });
      var response = await Dio().post(
        '${Constant.baseURLUpdated}${Constant.uploadSpendingBehavior}/',
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'x-functions-key': token},
        ),
      );
      CreditModuleDefaultResponse model =
          CreditModuleDefaultResponse.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        CreditModuleDefaultResponse model =
            CreditModuleDefaultResponse.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<CreditModuleDefaultResponse> createCreditUser(
    AddCreditScoreUserRequestModel userDetails,
    String userID,
  ) async {
    try {
      final Map<String, dynamic> rawData = {
        'firstName': userDetails.firstName,
        'lastName': userDetails.lastName,
        'gender': userDetails.gender,
        'dob': userDetails.dob,
        'profession': userDetails.profession,
        'employer': userDetails.employer,
        'employerAddress': userDetails.employerAddress,
        'monthlyIncome': userDetails.monthlyIncome
      };
      var response = await Dio().post(
        '${Constant.baseURLUpdated}${Constant.addCredtiScoreUser}/${userID}',
        data: rawData,
        options: Options(
          contentType: Headers.textPlainContentType,
          headers: {
            'x-functions-key':
                'ncHmszl6DXIVmsFdmQ4ZvfVeLCrWfi-IBX4w_RXnB2uKAzFuC74Xqg==',
            'Content-Type': 'application/json'
          },
        ),
      );
      print("ABC ${response}");
      CreditModuleDefaultResponse model =
          CreditModuleDefaultResponse.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        CreditModuleDefaultResponse model =
            CreditModuleDefaultResponse.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      CreditModuleDefaultResponse model = CreditModuleDefaultResponse(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
