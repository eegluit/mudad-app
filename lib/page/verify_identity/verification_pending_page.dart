import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';

class VerificationPendingPage extends StatelessWidget {
  static const route = '/verificationPendingPage';
  const VerificationPendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.07,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
            'Documents Under Review',
            style: TextStyle(
              color: ColorResource.mainColor,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),),
          SizedBox(
            height: Get.height * 0.07,
          ),
          SvgPicture.asset('images/pending_kyc.svg', width: Get.width * 0.5,),
          SizedBox(
            height: Get.height * 0.10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              'This ususally takes 24-48 hours. We will notify you as soon as your documents are verified ',
              style: TextStyle(
                color: Color(0xff616161),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: Get.height * 0.10,
          ),
          
        ],
      ),
    );
  }
}
