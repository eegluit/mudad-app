import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad/models/user_model.dart';
import '../../widget/log_print/log_print_condition.dart';
import '../network_calls/dio_client/dio_client.dart';
import '../network_calls/dio_client/get_it_instance.dart';
import '../utils/resource/string_resource.dart';
import '../../models/get_dashboard_data_response_model.dart';

class AuthServices extends GetxService {
  Rx<User> user = User().obs;
  GetStorage? box;
  RxString firebaseToken = "".obs;

  Future<AuthServices> init() async {
    box = GetStorage();
    getCurrentUserData();
    getFirebaseToken();
    return this;
  }

  Future<void> saveDashBoardData(DashboardResponseModel model) async {
    try {
      await box!.write(StringResource.instance.creditScore, model.creditScore.toString());
      await box!.write(StringResource.instance.isKyc, model.isKycComplemeted.toString());
      await box!.write(StringResource.instance.availableCredit, model.availableCredit.toString());
      await box!.write(StringResource.instance.isCreditScoreCalc, model.isCreditScoreCalculated.toString());
    } catch (e) {
      rethrow;
    }
  }

  saveUser(Map<String, dynamic> map) async {
    await box!.write(StringResource.instance.currentUser, map);
    user.value = User.fromJson(map);
    getCurrentUserData();
  }

  getCurrentUserData() async {
    if (box!.hasData(StringResource.instance.currentUser)) {
      logPrint(
          "user data box =>${box!.read(StringResource.instance.currentUser)}");
      try {
        user.value =
            User.fromJson(box!.read(StringResource.instance.currentUser));
        // logPrint(user.value.name);
      } catch (e) {
        logPrint("User Data Error =>$e");
      }
    } else {
      user.value = User();
    }
  }

  Future<void> saveUserToken(String token, String userID) async {
    try {
      await box!.write(StringResource.instance.token, token);
      await box!.write(StringResource.instance.userID, userID);
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

  String getUserID() {
    return box!.read(StringResource.instance.userID) ?? "";
  }
  String getCreditScore() {
    return box!.read(StringResource.instance.creditScore) ?? "";
  }
  String getAvailableCredit() {
    return box!.read(StringResource.instance.availableCredit) ?? "";
  }
  String getisKYC() {
    return box!.read(StringResource.instance.isKyc) ?? "";
  }
  String getisCreditScore() {
    return box!.read(StringResource.instance.isCreditScoreCalc) ?? "";
  }
  String getUserToken() {
    return box!.read(StringResource.instance.token) ?? "";
  }

  bool get isFirst => box!.read(StringResource.instance.isFirst) ?? false;
  bool get isLogin => box!.hasData(StringResource.instance.currentUser);
  bool get isPermission => box!.hasData(StringResource.instance.isPermission);
}
