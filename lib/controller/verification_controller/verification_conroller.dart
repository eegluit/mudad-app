import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../page/home/verification_view/verification_view.dart';
import '../../widget/image_picker/image_selection_util.dart';
import '../../page/home/home_page.dart';

class VerificationController extends GetxController{
  RxInt currentStep = 1.obs;
  RxInt selectedId = (-1).obs;
  RxBool isVerified = true.obs;
  Rx<File> selectedIdPic = File("").obs;
  Rx<File> selectSelfie = File("").obs;
  List<VerifyPage> verifyPageDataList = <VerifyPage>[
    VerifyPage(
        title: "Verify Your Identity",
        subTitle: "Simply use your phone camera to capture the following: "
    ),
    VerifyPage(
        title: "Select ID Type",
        subTitle: ""
    ),
    VerifyPage(
        title: "Take a Selfie",
        subTitle: "Place your face inside the oval and press start when you are ready"
    ),
    VerifyPage(
        title: "Verification\nProcess ",
        subTitle: ""
    ),
  ];

  late ImageSelectionUtil imageSelectionUtils =
  ImageSelectionUtil((String base64Image,File imageFiles) async {
    if(currentStep.value == 2){
      selectedIdPic.value = imageFiles;
    }else{
    selectSelfie.value = imageFiles;
    }
  });

  openSelfieCamera(){
    imageSelectionUtils.pickImageViaCamera();
  }

  onVerifyIdentity(){
    currentStep.value = 2;
  }

  onSelectId(){
    currentStep.value = 3;
    openSelfieCamera();
  }

  onTakeSelfie(){
    if(selectSelfie.value.path == ""){
      openSelfieCamera();
    }else{
      currentStep.value = 4;
    }

  }
  onVerificationComplete(){
 Get.offAllNamed(HomePage.route);
  }
  onSkipNowButton(){

  }
}