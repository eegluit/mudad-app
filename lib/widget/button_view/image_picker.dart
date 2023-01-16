import 'package:flutter/material.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

void showImagePicker(context,{required VoidCallback onCamaraTap,required VoidCallback onGalleryTap}) {
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
                      leading: const Icon(
                        Icons.photo_library,
                        color: ColorResource.white,
                      ),
                      title:  Text(
                        "Gallery",
                        style: StyleResource.instance.styleMedium(DimensionResource.fontSizeDefault, ColorResource.white),
                      ),
                      onTap:onGalleryTap),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:  ListTile(
                    leading: const Icon(
                      Icons.photo_camera,
                      color: ColorResource.white,
                    ),
                    title:  Text("Camera", style: StyleResource.instance.styleMedium(DimensionResource.fontSizeDefault, ColorResource.white)),
                    onTap:onCamaraTap,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
