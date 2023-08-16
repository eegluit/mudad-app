import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad/model/models/dashboard_model/dashboard_model.dart';
import 'package:mudad/models/get_vendors_response_model.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/widget/toast_view/showtoast.dart';
import '../model/models/get_vendor_model/get_vendor_model.dart';
import '../model/models/profile_model/get_profile_model.dart';
import '../model/models/profile_model/get_user_profile.dart';
import '../model/network_calls/dio_client/get_it_instance.dart';
import '../model/provider/home_provider.dart';
import '../models/user_model.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../service/credit_service.dart';
import 'package:mudad/model/services/auth_service.dart';

class HomeController extends GetxController {
  HomeProvider homeProvider = getIt();
  Rx<File> selectedBankStatement = File("").obs;
  RxInt selectedIndex = 0.obs;
  RxBool isMerchantLoading = false.obs;
  RxBool isProfileLoading = false.obs;
  Rx<DashBoard> dashBoardData = DashBoard().obs;
  Rx<GetVendorsModel> vendorData = GetVendorsModel().obs;
  Rx<GetProfileModel> profileData = GetProfileModel().obs;
  List<VendorsResponseModel> vendorList = [];
  List<Map<String, dynamic>> bottomBarList = [
    {"image": 'images/home.svg', "title": "Home"},
    {"image": 'images/offers.svg', "title": "Offers"},
    {"image": 'images/vendors.svg', "title": "Vendors"},
    {"image": ImageResource.instance.transactionIcon, "title": "Transaction"},
    {"image": 'images/settings.svg', "title": "Settings"},
  ];

  RxList<String> vendorsList = <String>[
    ImageResource.instance.luluIcon,
    ImageResource.instance.nandoIcon,
    ImageResource.instance.starBuckIcon,
    ImageResource.instance.diorIcon,
    ImageResource.instance.macIcon,
    ImageResource.instance.hnmIcon,
  ].obs;

  onItemTapped(int index) {
    selectedIndex.value = index;
    //logPrint(selectedIndex.value);
  }

  final storage = GetStorage();
  final searchController = TextEditingController();
  // var isFile = false.obs;
  var isLoading = false.obs;
  RxBool isDashBoardLoading = false.obs;
  var creditService = CreditService();
  var token = Get.find<AuthServices>().getUserToken();

  String get getToken => storage.read('token') ?? '';

  void setToken(String value) => storage.write('token', value);

  // UserModel get getUser {
  //   var model = storage.read('user');
  //   if (model is UserModel) {
  //     return model;
  //   } else {
  //     return UserModel.fromJson(model);
  //   }
  // }

  // void setUser(UserModel value) => storage.write('user', value);

  Future<File> pdfPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      // isFile(true);
      return File(result.files.single.path!);
    } else {
      // isFile(false);
      return File('');
      // User canceled the picker
    }
  }

  Future getDashBoardData() async {
    isDashBoardLoading(true);
    await homeProvider.getDashBoard(onError: (status, message) {
      toastShow(massage: message);
      isDashBoardLoading(false);
    }, onSuccess: (status, message, map) {
      if (map != null) {
        dashBoardData.value = DashBoard.fromJson(map);
      }
      isDashBoardLoading(false);
    });
  }

  // Future getVendors()async{
  //   isMerchantLoading.value = true;
  //   await homeProvider.getVendors(onError: (status,message){
  //     toastShow(massage: message);
  //     isMerchantLoading.value = false;
  //   }, onSuccess: (status,message,map){
  //     if(map != null){
  //       vendorData.value = GetVendorsModel.fromJson(map);
  //     }
  //     isMerchantLoading.value = false;
  //   });
  // }

  Future getVendors() async {
    homeProvider.homeRepo.getVendors(token).then((response) {
      vendorList = response.response!;
    });
  }

  Future getProfile() async {
    isProfileLoading(true);
    await homeProvider.getProfile(onError: (status, message) {
      // toastShow(massage: message);
      isProfileLoading(false);
    }, onSuccess: (status, message, map) {
      if (map != null) {
        profileData.value = GetProfileModel.fromJson(map);
      }
      isProfileLoading(false);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.arguments != null) {
      //setUser(Get.arguments[0]);
      setToken(Get.arguments[1]);
    }
    getProfile();
    getDashBoardData();
    getVendors();
    super.onInit();
  }
}
