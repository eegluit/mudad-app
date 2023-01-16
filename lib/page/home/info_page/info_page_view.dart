
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';

import '../../../controller/last_transaction_controller/info_page_controller.dart';
import '../../../utils/utils/resource/color_resource.dart';
import '../../../utils/utils/resource/dimensions_resource.dart';
import '../../../widget/base_view/base_view.dart';
import '../../../widget/text_field_view/common_textfield.dart';

class InfoPageViewScreen extends GetView<InfoPageController> {
  static const route = '/infoPageViewScreen';
  const InfoPageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: controller.title.value,
        child: Column(
          children: [
            const SizedBox(
              height: DimensionResource.marginSizeExtraLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style: StyleResource.instance.styleRegular(DimensionResource.fontSizeDefault, ColorResource.black).copyWith(height: 1.6,letterSpacing: .6),),
            )
          ],
        ));
  }
}