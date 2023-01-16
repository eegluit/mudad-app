import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/image_resource.dart';

class MainViewScreen extends StatelessWidget {
  final Widget header;
  final Widget body;
  final bool ?isBottomBarAvailable;
  const MainViewScreen({Key? key,required this.body,required this.header,this.isBottomBarAvailable}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResource.mainColor,
     child: Column(
       children: [
         Container(
           padding: EdgeInsets.only(top: MediaQuery.of(Get.context!).padding.top),
           height: MediaQuery.of(context).size.height*.15,

           child: header,
         ),
         Align(
           alignment: Alignment.bottomCenter,
           child: Container(
             padding:const EdgeInsets.only(top: 20),
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage(ImageResource.instance.mainViewBackground,),
                 fit: BoxFit.fill
               )
             ),
             height: MediaQuery.of(context).size.height*.85-(isBottomBarAvailable==false?0:77),
             child: body,
           ),
         )
       ],
     ),
    );
  }
}
