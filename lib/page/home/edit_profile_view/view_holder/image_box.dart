import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../../../../controller/profile_view_controller/edit_profile_controller.dart';
import '../../../../utils/utils/resource/color_resource.dart';
import '../../../../utils/utils/resource/image_resource.dart';
import '../../../../widget/button_view/image_picker.dart';
import '../../../../widget/cachednetworkimagewidget/cachednetworkimagewidget.dart';


class ProfileImagePox extends GetView<EditProfileController> {
  final bool? updatePartialProfile;
  const ProfileImagePox({Key? key, this.updatePartialProfile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
        children: [
          Hero(
            tag: "profile",
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100), // if you need this
              ),
              child: Obx(() {                        
                return Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 2, color: ColorResource.mainColor),
                      color: ColorResource.lightGrey),
                  child: controller.profileBaseImage.value != ""
                      ? Obx(() {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.memory(
                              base64.decode(controller.profileBaseImage.value),
                              fit: BoxFit.cover,
                            ),
                          );
                        })
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: cachedNetworkImage(
                              controller.profileData.value.profile ??
                                  ImageResource.instance.defaultUser)),
                );
              }),
            ),
          ),
          // Positioned(
          //   bottom: 7,
          //   right: 7,
          //   child: InkWell(
          //     onTap: () {
          //       showImagePicker(context ,
          //           onCamaraTap: () {controller.imgFromCamera(updatePartialProfile!);Navigator.of(context).pop();},
          //         onGalleryTap: () {controller.imgFromGallery(updatePartialProfile!);Navigator.of(context).pop();},
          //       );
          //     },
          //     child: Container(
          //       height: 30,
          //       width: 30,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: ColorResource.mainColor,
          //       ),
          //       child:const Icon(
          //         Icons.edit_outlined,
          //         color: ColorResource.white,
          //         size: 15,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
