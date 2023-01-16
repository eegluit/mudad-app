import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mudad/model/repository/home_repo.dart';

import '../../provider/home_provider.dart';
import '../../utils/resource/app_constants.dart';
import 'dio_client.dart';
import 'logging_interceptor.dart';


GetIt getIt = GetIt.instance;

Future<void> getInit() async {
  /// Core
  // getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  getIt.registerLazySingleton(() => DioClient(AppConstants.instance.baseUrl, getIt(), loggingInterceptor: getIt(),));

  /// External
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => Connectivity());

  /// Repository
  getIt.registerLazySingleton(() => HomeRepo(dioClient: getIt(),));


  /// Provider
  getIt.registerFactory(() => HomeProvider(homeRepo: getIt()));



}