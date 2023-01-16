
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils/resource/color_resource.dart';

void showImagePicker(context, {VoidCallback ?onGalleryTap, VoidCallback ?onCameraTap}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorResource.mainColor,
            ),
            child:  Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:  ListTile(
                      leading:const  Icon(
                        Icons.photo_library,
                        color: ColorResource.white,
                      ),
                      title:  Text(
                        "Gallery".tr,
                        style:const TextStyle(color: ColorResource.white),
                      ),
                      onTap: onGalleryTap
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:  ListTile(
                    leading:const  Icon(
                      Icons.photo_camera,
                      color: ColorResource.white,
                    ),
                    title:  Text("Camera".tr, style:const TextStyle(color: ColorResource.white)),
                    onTap: onCameraTap
                  ),
                ),
              ],
            ),
          ),
        );
      });
}