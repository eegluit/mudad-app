import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:get/get.dart' as get_pack;
import 'package:mudad/controller/home_controller.dart';

import '../../../widget/log_print/log_print_condition.dart';
import '../../services/auth_service.dart';
import 'logging_interceptor.dart';



class DioClient {
  final String baseUrl;
  final LoggingInterceptor? loggingInterceptor;

  late Dio dio;
  late String token;

  DioClient(this.baseUrl, Dio? dioC, {this.loggingInterceptor,}) {
    token = "";
    //token = get_pack.Get.find<AuthServices>().getUserToken();
    token = get_pack.Get.find<AuthServices>().getUserToken();
    logPrint("Token : $token");
    dio = dioC ?? Dio();
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 50000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'authentication': 'Bearer $token'
      };
    dio.interceptors.add(loggingInterceptor!);
    dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
  }

  Future<Response> get(String uri, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress,}) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const  FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String uri, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      logPrint("catch $e");
      rethrow;
    }
  }

  Future<Response> put(String uri, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress,}) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      logPrint("catch $e");
      rethrow;
    }
  }

  Future<Response> delete(String uri, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken,}) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const  FormatException("Unable to process the data");
    } catch (e) {
      logPrint("catch $e");
      rethrow;
    }
  }
}
