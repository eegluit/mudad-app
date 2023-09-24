import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad/service/kyc_service.dart';
import 'model/network_calls/dio_client/get_it_instance.dart';
import 'model/services/auth_service.dart';
import 'model/services/globleService.dart';
import 'routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() async {
  await initServices();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(MyApp());
}

initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();
  await getInit();
  await Get.putAsync(() => AuthServices().init());
  await Get.putAsync(() => GlobalService().init());
  Get.log('All services started...');
  return;
}

Future<void> clearClipboard() async {
  await Clipboard.setData(ClipboardData(text: ''));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final textTheme = Get.textTheme;

  @override
  void initState() {
    super.initState();
    clearClipboard();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
      clearClipboard();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Madad',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          color: ColorResource.mainColor,
        ),
        textTheme: GoogleFonts.latoTextTheme(textTheme),
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
