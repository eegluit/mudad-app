import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/network_calls/dio_client/get_it_instance.dart';
import 'model/services/auth_service.dart';
import 'model/services/globleService.dart';
import 'routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();
  await getInit();
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => GlobalService().init());
  Get.log('All services started...');
  return;
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mudad',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: ColorResource.mainColor,),
        textTheme: GoogleFonts.latoTextTheme(textTheme),
        // appBarTheme: Get.theme.appBarTheme.copyWith(
        //   elevation: 0.0,
        //   // systemOverlayStyle: const SystemUiOverlayStyle(
        //   //   //statusBarColor: Colors.white,
        //   //   statusBarIconBrightness: Brightness.dark,
        //   //   statusBarBrightness: Brightness.dark,
        //   // ),
        // ),
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
