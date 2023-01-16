import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/base_model.dart';
import '../models/question_request_model.dart';
import '../utils/constant/constant.dart';
import 'package:http_parser/http_parser.dart';

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
          contentType: Headers.formUrlEncodedContentType,
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
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: e.message,
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
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: e.message,
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
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: e.message,
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
          message: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      BaseModel model = BaseModel(
        message: e.message,
        code: 400,
      );
      return model;
    }
  }
}
