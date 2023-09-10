import 'package:flutter/material.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;
  final bool? showBorder;
  final Color color;
  final Color ?borderColor;
  final Color ?textColor;
  final double ?width;
  final double ?height;
  final double ?textSize;

  const CommonButton({Key? key, required this.text, required this.loading, required this.onPressed, required this.color,this.textColor,this.width,this.showBorder,this.height,this.borderColor,this.textSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height??55,
        width: width??double.infinity,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15),border:showBorder==true? Border.all(color: ColorResource.mainColor,width: 2):Border.all(color: borderColor??color,width: 1.5),boxShadow: DecorationResource.instance.containerBoxShadow()),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: MaterialButton(
              onPressed: loading ? null: onPressed,
              child: Center(
                child: loading == true
                    ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ))
                    : Text(text,
                    style: StyleResource.instance.styleMedium(
                        textSize?? DimensionResource.fontSizeDoubleExtraLarge,
                        textColor?? ColorResource.white)),
              )),
        ));
  }
}
