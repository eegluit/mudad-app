import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controller/profile_view_controller/edit_profile_controller.dart';
import '../../../utils/utils/resource/color_resource.dart';
import '../../../widget/base_view/base_view.dart';
import '../../../widget/button_view/common_button.dart';
import '../../../widget/text_field_view/common_textfield.dart';
import 'view_holder/image_box.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  static const route = '/editProfileScreen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseView(
          title: "Edit Personal information",
          child: _buildEditProfileBody(context,controller),
        ),
        Obx(
                () {
              return Visibility(
                visible: controller.isProfileLoading.value,
                child: Container(
                  color: ColorResource.white.withOpacity(0.4),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorResource.mainColor,
                    ),
                  ),
                ),
              );})
      ],
    );
  }
}
Widget _buildEditProfileBody(BuildContext context ,EditProfileController controller){
  return Form(
    key: controller.formKey,
    child: Obx(()=>ListView(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      children: [
        const Center(child: ProfileImagePox(updatePartialProfile: false,)),
        const SizedBox(height: 30,),
        CommonTextField(
          label: "Name",
          controller: controller.nameController.value,
          keyboardType: TextInputType.text,
          hintText: "Enter your name.".tr,
          validator: (value) {
            if (value!.isEmpty) {
              controller.nameError.value = "Please enter your name.".tr;
              return "";
            } else if (value.removeAllWhitespace == "") {
              controller.nameError.value = "Please enter valid name.".tr;
              return null;
            } else {
              controller.nameError.value = "";
              return null;
            }
          },
          errorText: controller.nameError.value,
        ),
        const SizedBox(height: 30,),
        CommonTextField(
          label: "Email",
          controller: controller.emailController.value,
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your email address.".tr,
          readOnly: true,
          validator: (value) {
            if (value!.isEmpty) {
              controller.emailError.value = "Please enter your email address.".tr;
              return "";
            } else if (value.removeAllWhitespace == "") {
              controller.emailError.value = "Please enter valid email address.".tr;
              return "";
            } else {
              controller.emailError.value = "";
              return null;
            }
          },
          errorText: controller.emailError.value,
        ),
        const SizedBox(height: 30,),
        CommonTextField(
          label: "Phone Number",
          controller: controller.phoneNumberController.value,
          keyboardType: TextInputType.number,
          hintText: "Enter your phone number.".tr,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          validator: (value) {
            if (value!.isEmpty) {
              controller.phoneNumberError.value = "Please enter your phone number.".tr;
              return "";
            } else if (value.removeAllWhitespace == "") {
              controller.phoneNumberError.value = "Please enter valid phone number.".tr;
              return "";
            } else {
              controller.phoneNumberError.value = "";
              return null;
            }
          },
          errorText: controller.phoneNumberError.value,
        ),
        const SizedBox(height: 40,),
        CommonButton(text: "Update Profile",color: ColorResource.mainColor,onPressed:controller.updateUserInfo,loading: controller.isLoading.value,)
      ],
    )),
  );
}
