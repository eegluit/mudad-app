import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mudad',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: const Color(0xFF651F6B)),
        textTheme: GoogleFonts.latoTextTheme(textTheme),
        appBarTheme: Get.theme.appBarTheme.copyWith(
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
