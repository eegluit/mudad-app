import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils/resource/color_resource.dart';
import '../../../widget/base_view/base_view.dart';
import '../../../widget/button_view/common_button.dart';
import '../../../controller/vendor_details_controller.dart';
import '../../home/vendor_map_location/vendor_map_location.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';
import '../../../utils/utils/resource/dimensions_resource.dart';
import '../../../widget/cachednetworkimagewidget/cachednetworkimagewidget.dart';
import '../../../utils/constant/constant.dart';

class VendorsDetailView extends GetView<VendorDetailsController> {
  static const route = '/VendorsDetailsView';

  const VendorsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Vendors Details",
      child: _buildVendorsDetailsBody(context, controller),
    );
  }
}

Widget _buildVendorsDetailsBody(
    BuildContext context, VendorDetailsController controller) {
  return ListView(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    children: [
      const SizedBox(
        height: 30,
      ),
      Center(child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFF1E2668),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: cachedNetworkImage(
                                          '${Constant.imageUrl}store/${controller.logo}',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),)),
      const SizedBox(
        height: 30,
      ),
      createVendorDetails('Name', controller.name.value),
      const SizedBox(
        height: 30,
      ),
      createVendorDetails('Address', controller.address.value),
      const SizedBox(
        height: 30,
      ),
      const SizedBox(
        height: 40,
      ),
      CommonButton(
        text: "View Location on Map",
        color: ColorResource.mainColor,
        onPressed: () {
          Get.toNamed(VendorMapLocation.route, arguments: {
            "name": controller.name.value,
            "lat": controller.lat.value,
            "long": controller.long.value
          });
        },
        loading: false,
      )
    ],
  );
}

Padding createVendorDetails(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: DimensionResource.marginSizeLarge),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: StyleResource.instance.styleMedium(
              DimensionResource.fontSizeLarge + 2,
              ColorResource.black.withOpacity(0.4)),
        ),
        Text(
          value,
          style: StyleResource.instance.styleSemiBold(
              DimensionResource.fontSizeLarge + 2,
              ColorResource.black.withOpacity(0.85)),
        )
      ],
    ),
  );
}
