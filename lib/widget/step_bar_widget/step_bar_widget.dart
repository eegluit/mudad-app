import 'package:flutter/material.dart';
import 'package:mudad/utils/utils/resource/dimensions_resource.dart';

import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/image_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

class StepBar extends StatelessWidget {
  final bool stepFirstComplete;
  final bool stepSecondComplete;
  final bool stepThirdComplete;
  final bool stepFourthComplete;
  final int currentStep;
  const StepBar(
      {Key? key,
        required this.currentStep,
        required this.stepThirdComplete,
        required this.stepSecondComplete,
        required this.stepFirstComplete,
        required this.stepFourthComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: stepFirstComplete && currentStep >= 1
                          ? ColorResource.mainColor
                          : ColorResource.borderColor,
                      width: 6),
                  color: ColorResource.mainColor),
              child: Center(
                  child: stepFirstComplete && currentStep > 1
                      ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(ImageResource.instance.checkIcon,color: ColorResource.white,),
                  )
                      : Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: stepFirstComplete
                              ? ColorResource.white
                              : ColorResource.mainColor,
                          width: 3),
                      color: stepFirstComplete
                          ? ColorResource.mainColor
                          : ColorResource.white,
                    ),
                  )),
            ),
            const SizedBox(
              width: DimensionResource.marginSizeSmall,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("RO300",style: StyleResource.instance.styleExtraBold(DimensionResource.fontSizeDefault, ColorResource.secondColor).copyWith(letterSpacing: .5),),
                const SizedBox(
                  height: DimensionResource.marginSizeExtraSmall-3,
                ),
                Text("1st payment",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.secondColor).copyWith(letterSpacing: .5),)
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: ColorResource.greenColor.withOpacity(0.3),
                border: Border.all(
                  color: ColorResource.borderColor,
                )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text("Paid",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeExtraSmall, ColorResource.secondColor),),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeExtraSmall),
            child: VerticalDivider(
              color: stepSecondComplete
                  ? ColorResource.mainColor
                  : ColorResource.borderColor,
              thickness: 3,

              //height: 0,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: stepSecondComplete && currentStep >= 2
                          ? ColorResource.mainColor
                          : ColorResource.borderColor,
                      width: 6),
                  color: ColorResource.mainColor),
              child: Center(
                  child: stepSecondComplete && currentStep > 2
                      ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(ImageResource.instance.checkIcon),
                  )
                      : Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: stepSecondComplete
                              ? ColorResource.white
                              : ColorResource.mainColor,
                          width: 3),
                      color: stepSecondComplete
                          ? ColorResource.mainColor
                          : ColorResource.white,
                    ),
                  )),
            ),
            const SizedBox(
              width: DimensionResource.marginSizeSmall,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("RO300",style: StyleResource.instance.styleExtraBold(DimensionResource.fontSizeDefault, ColorResource.secondColor).copyWith(letterSpacing: .5),),
                const SizedBox(
                  height: DimensionResource.marginSizeExtraSmall-3,
                ),
                Text("2nd payment",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.secondColor).copyWith(letterSpacing: .5),)
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: ColorResource.borderColor.withOpacity(0.3),
                  border: Border.all(
                    color: ColorResource.borderColor,
                  )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text("Due by 10th Jan",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeExtraSmall, ColorResource.secondColor),),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeExtraSmall),
            child: VerticalDivider(
              color: stepThirdComplete
                  ? ColorResource.mainColor
                  : ColorResource.borderColor,
              thickness: 2,

            ),
          ),
        ),
        Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: stepThirdComplete && currentStep >= 3
                          ? ColorResource.mainColor
                          : ColorResource.borderColor,
                      width: 6),
                  color: ColorResource.mainColor),
              child: Center(
                  child: stepThirdComplete && currentStep > 3
                      ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(ImageResource.instance.checkIcon),
                  )
                      : Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: stepThirdComplete
                              ? ColorResource.white
                              : ColorResource.mainColor,
                          width: 3),
                      color: stepThirdComplete
                          ? ColorResource.mainColor
                          : ColorResource.white,
                    ),
                  )),
            ),
            const SizedBox(
              width: DimensionResource.marginSizeSmall,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("RO300",style: StyleResource.instance.styleExtraBold(DimensionResource.fontSizeDefault, ColorResource.secondColor).copyWith(letterSpacing: .5),),
                const SizedBox(
                  height: DimensionResource.marginSizeExtraSmall-3,
                ),
                Text("3rd payment",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.secondColor).copyWith(letterSpacing: .5),)
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: ColorResource.borderColor.withOpacity(0.3),
                  border: Border.all(
                    color: ColorResource.borderColor,
                  )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text("Due by 20th Jan",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeExtraSmall, ColorResource.secondColor),),
            )
          ],
        ),
        // Expanded(
        //   child: VerticalDivider(
        //     color: stepFourthComplete
        //         ? ColorResource.mainColor
        //         : ColorResource.borderColor,
        //     thickness: 2,
        //
        //   ),
        // ),
        // Container(
        //   height: 33,
        //   width: 33,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(
        //           color: stepFourthComplete && currentStep >= 4
        //               ? ColorResource.mainColor
        //               : ColorResource.borderColor,
        //           width: 6),
        //       color: ColorResource.mainColor),
        //   child: Center(
        //       child: stepFourthComplete && currentStep > 4
        //           ? Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: Image.asset(ImageResource.instance.checkIcon),
        //       )
        //           : Container(
        //         height: 20,
        //         width: 20,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30),
        //           border: Border.all(
        //               color: stepFourthComplete
        //                   ? ColorResource.white
        //                   : ColorResource.mainColor,
        //               width: 3),
        //           color: stepFourthComplete
        //               ? ColorResource.mainColor
        //               : ColorResource.white,
        //         ),
        //       )),
        // ),
      ],
    );
  }
}