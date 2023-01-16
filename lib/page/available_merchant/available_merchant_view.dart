import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/controller/home_controller.dart';
import 'package:mudad/widget/base_view/base_view.dart';

import '../../utils/utils/resource/dimensions_resource.dart';

class AvailableMerchantScreen extends GetView<HomeController> {
  static const route = '/availableMerchant';
  const AvailableMerchantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(title: "Available Merchant", child: Column(
      children: [
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1.15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
            scrollDirection: Axis.vertical,
            itemCount: controller.vendorsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFF1E2668),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            controller.vendorsList[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
