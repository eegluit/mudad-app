import 'package:flutter/material.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

class ButtonResource{
  static ButtonResource ?_instance;
  static ButtonResource get instance => _instance ??=ButtonResource._init();
  ButtonResource._init();

  Widget smallBottomButton({double ?borderRadius,Color ?borderColor,Color ?backGroundColor, String ?title, Color ?titleColor, Widget? suffixIcon, Widget? prefixIcon, VoidCallback ?onTap}){
    return GestureDetector(
      onTap: onTap ?? (){},
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius??8),color: backGroundColor,border: Border.all(color: borderColor??backGroundColor!,width: 1.5)),
        child: Row(
          children: [
            Visibility(visible:prefixIcon!=null?true:false ,child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: prefixIcon ??const SizedBox(),
            )),
            Text(title ?? "",style: StyleResource.instance.styleMedium(DimensionResource.fontSizeDefault, titleColor ?? ColorResource.white),),
            Visibility(visible:suffixIcon!=null?true:false ,child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: suffixIcon ??const SizedBox(),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildIconButton({String? image, VoidCallback? onTap, AlignmentGeometry? alignmentGeometry,Color ?color}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Align(
            alignment: alignmentGeometry ?? Alignment.center,
            child: Image.asset(
              image!,
              height: 20,
              color: color??ColorResource.black,
            )),
      ),
    );
  }

  Widget borderIconButton({required Color borerColor ,required Color backGroundColor,required IconData icon,required Color iconColor,required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borerColor),
          color: backGroundColor,
        ),
        child: Icon(icon,color: iconColor,size: 15,),
      ),
    );
  }
  Widget iconButton({String? image, VoidCallback? onTap, AlignmentGeometry? alignmentGeometry,double ?imageHeight,Color ?color}) {
    return InkWell(
      splashColor: Colors.transparent,
      overlayColor:MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Align(
            alignment: alignmentGeometry ?? Alignment.center,
            child: Image.asset(
              image!,
              color: color??ColorResource.black,
              height:imageHeight?? 15,
            )),
      ),
    );
  }

}
