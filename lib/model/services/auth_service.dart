import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad/models/user_model.dart';
import '../../widget/log_print/log_print_condition.dart';
import '../network_calls/dio_client/dio_client.dart';
import '../network_calls/dio_client/get_it_instance.dart';
import '../utils/resource/string_resource.dart';

class AuthService extends GetxService {
  Rx<UserModel> user = UserModel().obs;
  GetStorage? box;
  RxString firebaseToken = "".obs;

  Future<AuthService> init() async {
    box = GetStorage();
    getCurrentUserData();
    getFirebaseToken();
    return this;
  }

  saveUser(Map<String, dynamic> map) async {
    await box!.write(StringResource.instance.currentUser, map);
     user.value = UserModel.fromJson(map);
    getCurrentUserData();
  }

  getCurrentUserData() async {
    if (box!.hasData(StringResource.instance.currentUser)) {
      logPrint("user data box =>${box!.read(StringResource.instance.currentUser)}");
      try{
         user.value = UserModel.fromJson(box!.read(StringResource.instance.currentUser));
        // logPrint(user.value.name);
      }catch(e){
        logPrint("User Data Error =>$e");
      }
    } else {
       user.value = UserModel();
    }
  }

  Future<void> saveUserToken(String token) async {
    final DioClient dioClient = getIt();
    dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'authentication': 'Bearer $token'
    };
    try {
      await box!.write(StringResource.instance.token, token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeUserData() async {
    //user.value = UserModel();
    await box!.remove(StringResource.instance.currentUser);
  }

  Future<void> removeToken() async {
    await box!.remove(StringResource.instance.token);
  }

  Future<void> removeIsRemember() async {
    await box!.remove(StringResource.instance.remember);
  }

  Future<void> logOut() async {
    await removeUserData();
    await removeToken();
    await removeIsRemember();
    DioClient dio = getIt();
    dio.dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '
    };
    // Get.offAllNamed(Routes.loginScreen);
  }

  Future<void> getFirebaseToken() async {
    // AppConstants.firebaseToken.value = (await FirebaseMessaging.instance.getToken())!;
    // logPrint("firebaseToken=>${AppConstants.firebaseToken.value}");
  }

  String getUserToken() {
    return box!.read(StringResource.instance.token) ?? "";
  }

  bool get isFirst => box!.read(StringResource.instance.isFirst) ?? false;
  bool get isLogin => box!.hasData(StringResource.instance.currentUser);
  bool get isPermission => box!.hasData(StringResource.instance.isPermission);
}
