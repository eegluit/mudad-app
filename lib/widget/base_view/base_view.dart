import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';

class BaseView extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget child;
  final Widget? topChild;
  final Function()? onBack;
  const BaseView({Key? key,this.leading,this.onBack,required this.title,required this.child,this.topChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.mainColor,
      appBar: AppBar(
        backgroundColor: ColorResource.mainColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: onBack??(){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new,color: ColorResource.white,),
        ),
        centerTitle: false,
        title: Text(
          title,
          style: const TextStyle(
            color: ColorResource.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topChild??const SizedBox(),
          Expanded(
            child: Container(
              height: Get.height-100,
              //width: Get.width,
              margin: const EdgeInsets.only(top: DimensionResource.marginSizeLarge),
              decoration:  BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, -2.0),
                    blurRadius: 8,
                  )
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}