import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/controller/home_controller.dart';
import 'package:mudad/widget/base_view/base_view.dart';

import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/image_resource.dart';
import '../home/tab/main_page.dart';

class TopOffersScreen extends GetView<HomeController> {
  static const route = '/topOffersScreen';
  const TopOffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(title: "Offers", child: Column(
      children: [
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
                child: buildOffersBoxUi(
                    image:index.isOdd?ImageResource.instance.offer1Icon:ImageResource.instance.offer2Icon,
                    discountDes: "Daily login bonus \$50 max discount",
                    discountTitle: "10% off your next order",
                    code: "INABFQ"
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}