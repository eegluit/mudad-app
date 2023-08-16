import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mudad/controller/home_controller.dart';
import '../model/models/profile_model/get_profile_model.dart';
import '../model/network_calls/dio_client/get_it_instance.dart';
import '../model/provider/home_provider.dart';
import '../service/credit_service.dart';

class PersonalController extends GetxController {
  HomeProvider homeProvider = getIt();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isProfileLoading = false.obs;
  Rx<TextEditingController> fNameController = TextEditingController().obs;
  Rx<TextEditingController> lNameController = TextEditingController().obs;
  Rx<TextEditingController> dobController = TextEditingController().obs;
  Rx<TextEditingController> professionController = TextEditingController().obs;
  Rx<TextEditingController> empolyerController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> incomeController = TextEditingController().obs;

  RxString fNameError = "".obs;
  RxString lNameError = "".obs;
  RxString incomeError = "".obs;
  RxString profError = "".obs;
  RxString dobError = "".obs;
  RxString empNameError = "".obs;
  RxString empAddError = "".obs;

  var gender = 'm'.obs;

  Rx<GetCreditProfileModel> profileData = GetCreditProfileModel().obs;

  var isLoading = false.obs;
  var creditService = CreditService();
  @override
  void onInit() {
    updateProfile();
    super.onInit();
  }

  Future updateProfile()async{
    isProfileLoading(true);
    await homeProvider.getCreditProfile(onError: (status,message){
      // toastShow(massage: message);
      isProfileLoading(false);
    }, onSuccess: (status,message,map){
      if(map != null){
        profileData.value = GetCreditProfileModel.fromJson(map);
        if(profileData.value.result?.firstName != null){
          fNameController.value.text =  profileData.value.result?.firstName??"";
          lNameController.value.text =  profileData.value.result?.lastName??"";
          dobController.value.text =  profileData.value.result?.dob??"";
          professionController.value.text =  profileData.value.result?.profession??"";
          empolyerController.value.text =  profileData.value.result?.employer??"";
          addressController.value.text =  profileData.value.result?.employerAddress??"";
          incomeController.value.text =  profileData.value.result?.monthlyIncome.toString()??"";
          if(profileData.value.result?.gender.toString().toLowerCase() == "male"){
            gender('m');
          }else{
            gender('f');
          }
        }
      }
      isProfileLoading(false);
    });
  }
}