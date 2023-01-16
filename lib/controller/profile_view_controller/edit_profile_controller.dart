import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mudad/controller/home_controller.dart';
import 'package:mudad/model/services/auth_service.dart';
import 'package:mudad/widget/text_field_view/regex/regex.dart';

import '../../model/models/profile_model/get_profile_model.dart';
import '../../model/models/profile_model/get_user_profile.dart';
import '../../model/network_calls/dio_client/get_it_instance.dart';
import '../../model/provider/home_provider.dart';
import '../../widget/log_print/log_print_condition.dart';
import '../../widget/toast_view/showtoast.dart';

class EditProfileController extends GetxController{
  HomeProvider homeProvider = getIt();
  final picker = ImagePicker();
  RxBool isProfileLoading = false.obs;
  RxBool isLoading = false.obs;
  late Rx<File> image = File("").obs;
  Rx<GetProfileModel> profileData = GetProfileModel().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> nameController  = TextEditingController().obs;
  Rx<TextEditingController> emailController  = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController  = TextEditingController().obs;
  RxString nameError = "".obs;
  RxString emailError = "".obs;
  RxString phoneNumberError = "".obs;

  imgFromGallery(bool updatePartialProfile) {
    picker.getImage(source: ImageSource.gallery,imageQuality: 30).then((pickedFile) async {
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }  else {
        print('No image selected.');
      }
    }).catchError((e){print(e);});
  }

  imgFromCamera(bool updatePartialProfile) {
    picker.getImage(source: ImageSource.camera,imageQuality: 30).then((pickedFile) async {
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }  else {
        print('No image selected.');
      }
    }).catchError((e){print(e);});
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProfile();
    super.onInit();
  }

  Future updateUserInfo()async{
    if(formKey.currentState!.validate() &&  isLoading.value == false){
      isLoading.value=true;
      try{
        Map<String, dynamic> userData = {
          "name":nameController.value.text,
          //"email":emailController.value.text,
          "mobile":phoneNumberController.value.text
        };

        await homeProvider.updateProfile(
            userData: userData ,image: image.value, onError:(errorMessage){
          isLoading.value=false;
          toastShow(massage: errorMessage??"Something want wrong here",error: true);
        }, onSuccess:(message,data)async{
          if(data!=null){
            await getProfile();
            await Get.find<HomeController>().getProfile();
          }
          isLoading.value = false;
        });
      }catch(e){logPrint(e);isLoading.value=false;}
    }

  }

  Future getProfile()async{
    isProfileLoading(true);
    await homeProvider.getProfile(onError: (status,message){
      // toastShow(massage: message);
      isProfileLoading(false);
    }, onSuccess: (status,message,map){
      if(map != null){
        profileData.value = GetProfileModel.fromJson(map);
        nameController.value.text = "${profileData.value.name??Get.find<AuthService>().user.value.user?.name ?? ""}";
        emailController.value.text = "${profileData.value.email??Get.find<AuthService>().user.value.user?.email??""}";
        phoneNumberController.value.text = profileData.value.mobile??"";
      }
      isProfileLoading(false);
    });
  }
}