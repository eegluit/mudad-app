import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';

import '../../controller/refer_friend_controller/refer_conttroller.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../widget/base_view/base_view.dart';

class ReferViewScreen extends GetView<ReferController> {
  static const route = '/referViewScreen';
  const ReferViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Earn Money By Refer",
        topChild: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: DimensionResource.marginSizeOverExtraLarge,
            ),
            Center(child: Image.asset(ImageResource.instance.referImage,height: 150,)),
            const SizedBox(
              height: DimensionResource.marginSizeLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorResource.lMainColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("mir20220320",style: StyleResource.instance.styleMedium(DimensionResource.fontSizeDefault, ColorResource.white),),
                        Text("Copy",style: StyleResource.instance.styleMedium(DimensionResource.fontSizeDefault, ColorResource.white),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: DimensionResource.marginSizeLarge,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorResource.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
                  child: Center(child: Text("SHARE",style: StyleResource.instance.styleSemiBold(DimensionResource.fontSizeDefault, ColorResource.mainColor),)),
                )
              ],
            ),
            ),
            const SizedBox(
              height: DimensionResource.marginSizeSmall,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: DimensionResource.marginSizeExtraLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Invite a friend",style: StyleResource.instance.styleSemiBold(DimensionResource.fontSizeOverLarge, ColorResource.mainColor),),
                    Icon(Icons.search,color: ColorResource.mainColor,size: 30,)
                  ],
                ),
              ),
              Column(
                children: List.generate(5, (index) => Padding(
                  padding:  EdgeInsets.only(left: DimensionResource.marginSizeLarge,right: DimensionResource.marginSizeLarge,top: index == 0? DimensionResource.marginSizeExtraLarge:20,),
                  child: Row(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: ColorResource.mainColor)
                        ),
                        padding: EdgeInsets.all(4),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(ImageResource.instance.defaultUser)),
                      ),
                      const SizedBox(
                        width: DimensionResource.marginSizeSmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tongkun Lee",
                            style: StyleResource.instance.styleMedium(DimensionResource.fontSizeExtraLarge, ColorResource.mainColor).copyWith(letterSpacing: .6),
                          ),
                          const SizedBox(
                            height: DimensionResource.marginSizeExtraSmall,
                          ),
                          Text(
                            "Facebook",
                            style: StyleResource.instance.styleRegular(DimensionResource.fontSizeDefault, ColorResource.mainColor.withOpacity(0.5)).copyWith(letterSpacing: .6),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorResource.eLMainColor.withOpacity(0.3),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
                        child: Center(child: Text("Invite",style: StyleResource.instance.styleSemiBold(DimensionResource.fontSizeDefault, ColorResource.mainColor),)),
                      )
                    ],
                  ),
                )),
              )
            ],
          ),
        ));
  }
}