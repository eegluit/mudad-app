import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/controller/take_selfie_controller.dart';
import 'package:mudad/widget/cachednetworkimagewidget/cachednetworkimagewidget.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/widget/log_print/log_print_condition.dart';

import '../../../controller/verification_controller/verification_conroller.dart';
import '../../../models/select_type_model.dart';
import '../../../utils/utils/resource/color_resource.dart';
import '../../../utils/utils/resource/dimensions_resource.dart';
import '../../../utils/utils/resource/image_resource.dart';
import '../../../utils/utils/resource/style_resource.dart';
import '../../../widget/button_view/common_button.dart';
import '../../base_view/base_view_screen.dart';
import '../../../widget/toast_view/showtoast.dart';
// import '../../../service/auth_service.dart';
import 'package:mudad/model/services/auth_service.dart';
import '../../../controller/auth_controller.dart';

import 'package:get/get.dart' as get_pack;

class VerificationScreen extends StatelessWidget {
  static const route = '/verifyIdentityPage';
  static TakeSelfieController selfieController =
      Get.find<TakeSelfieController>();
  var token = Get.find<AuthServices>().getUserToken();
  var userID = Get.find<AuthServices>().getUserID();

  VerificationScreen({Key? key}) : super(key: key);

  List<Widget> verifyWidgetList = <Widget>[
    IdentityWidget(),
    SelectIdWidget(),
    SelfieWidget(),
    VerificationProcessWidget()
  ];
  @override
  Widget build(BuildContext context) {
    return BaseMainView(
        viewControl: VerificationController(),
        onPageBuilder:
            (BuildContext context, VerificationController controller) =>
                _buildLoginView(context, controller));
  }

  Widget _buildLoginView(
      BuildContext context, VerificationController controller) {
    print(controller.currentStep.value);
    return Column(children: [
      Expanded(
          flex: 3,
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: DimensionResource.marginSizeDefault),
                  child: StepBar(
                    currentStep: controller.currentStep.value,
                    stepFirstComplete: controller.currentStep.value >= 1,
                    stepSecondComplete: controller.currentStep.value >= 2,
                    stepThirdComplete: controller.currentStep.value >= 3,
                    stepFourthComplete: controller.currentStep.value >= 4,
                  ),
                ),
                Text(
                  controller
                          .verifyPageDataList[controller.currentStep.value - 1]
                          .title +
                      "${controller.currentStep.value == 4 ? (controller.isVerified.value ? "Complete" : "Failed") : ""}",
                  style: StyleResource.instance.styleExtraBold(
                      DimensionResource.fontSizeDoubleOverExtraLarge,
                      ColorResource.mainColor),
                  textAlign: TextAlign.center,
                )
              ],
            );
          })),
      Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: DimensionResource.marginSizeLarge),
            child: Obx(() {
              return verifyWidgetList[controller.currentStep.value - 1];
            }),
          )),
      Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: DimensionResource.marginSizeLarge),
            child: Obx(() {
              return Column(
                children: [
                  Visibility(
                      visible: controller.currentStep.value == 1 ||
                          (controller.currentStep.value == 2 &&
                              controller.documentMap.isNotEmpty) ||
                          controller.currentStep.value == 3 ||
                          controller.currentStep.value == 4,
                      child: CommonButton(
                          text: controller.currentStep.value == 1
                              ? "Get Started"
                              : controller.currentStep.value == 2
                                  ? "Continue"
                                  : controller.currentStep.value == 3
                                      ? controller.selectSelfie.value.path != ""
                                          ? "Next"
                                          : "Start"
                                      : controller.isVerified.value
                                          ? "Next"
                                          : "Try Again",
                          loading: false,
                          onPressed: controller.currentStep.value == 1
                              ? controller.onVerifyIdentity
                              : controller.currentStep.value == 2
                                  ? () => selfieController.kycService
                                          .submitKycDoc(
                                              controller.documentMap,
                                              controller.selectedIdPic.value,
                                              token)
                                          .then((response) {
                                        if (response.code != 200) {
                                          toastShow(
                                              error: true,
                                              massage: response.message);
                                        } else {
                                          controller.onSelectId();
                                        }
                                      })
                                  : controller.currentStep.value == 3
                                      ? () {
                                          if (controller
                                                  .selectSelfie.value.path !=
                                              "") {
                                            controller.onSkipNowButton();
                                          } else {
                                            controller.liveness();
                                          }
                                          // selfieController.kycService
                                          //     .uploadProfileSelfie(
                                          //     controller.selectSelfie.value,
                                          //     userID,
                                          //     "ncHmszl6DXIVmsFdmQ4ZvfVeLCrWfi-IBX4w_RXnB2uKAzFuC74Xqg==")
                                          //     .then((response) {
                                          //   if (response.code != 200) {
                                          //     toastShow(
                                          //         error: true,
                                          //         massage:
                                          //         response.errorMessage);
                                          //   } else {
                                          //     controller.onTakeSelfie();
                                          //   }
                                          // }).then((_) {
                                          //   selfieController.kycService
                                          //       .submitKycSelfie(
                                          //       controller
                                          //           .selectSelfie.value,
                                          //       token)
                                          //       .then((response) {
                                          //     if (response.code != 200) {
                                          //       toastShow(
                                          //           error: true,
                                          //           massage: response.message);
                                          //     } else {
                                          //       controller.onTakeSelfie();
                                          //     }
                                          //   });
                                          // });
                                        }
                                      : controller.onVerificationComplete,
                          color: ColorResource.mainColor)),
                  Visibility(
                      visible: (controller.currentStep.value == 3 &&
                              controller.selectSelfie.value.path != "") ||
                          (controller.currentStep.value == 4 &&
                              !controller.isVerified.value),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: CommonButton(
                          text: controller.currentStep.value == 3
                              ? "Re-Take"
                              : "skip for now",
                          loading: false,
                          onPressed: controller.currentStep.value == 3
                              ? controller.openSelfieCamera
                              : controller.onSkipNowButton,
                          color: ColorResource.white,
                          textColor: ColorResource.secondColor,
                        ),
                      )),
                ],
              );
            }),
          ))
    ]);
  }
}

class IdentityWidget extends GetView<VerificationController> {
  IdentityWidget({Key? key}) : super(key: key);
  List<String> verifyIdentityList = <String>[
    'Your identification document',
    'A quick selfie',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              vertical: DimensionResource.marginSizeLarge),
          child: Text(
            controller
                .verifyPageDataList[controller.currentStep.value - 1].subTitle,
            style: StyleResource.instance
                .styleMedium(DimensionResource.fontSizeExtraLarge,
                    ColorResource.mainColor)
                .copyWith(height: 1.7, letterSpacing: .5),
          ),
        ),
        const SizedBox(
          height: DimensionResource.marginSizeExtraLarge + 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              verifyIdentityList.length,
              (index) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: DimensionResource.marginSizeSmall,
                      horizontal: DimensionResource.marginSizeLarge,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorResource.mainColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '${index + 1}',
                              style: StyleResource.instance.styleMedium(
                                  DimensionResource.fontSizeLarge,
                                  ColorResource.mainColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: DimensionResource.marginSizeDefault,
                        ),
                        Text(
                          verifyIdentityList.elementAt(index),
                          style: StyleResource.instance.styleMedium(
                              DimensionResource.fontSizeExtraLarge,
                              ColorResource.mainColor),
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

class SelectIdWidget extends GetView<VerificationController> {
  SelectIdWidget({Key? key}) : super(key: key);
  static TakeSelfieController selfieController =
      Get.find<TakeSelfieController>();
  List<SelectTypeModel> typeList = [
    SelectTypeModel(
      id: 1,
      name: "Upload Document",
    ),
  ];
  var typeId = 0.obs;
  var token = Get.find<AuthServices>().getUserToken();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(children: [
        const Center(
          child: Text(
            'Please provide one of the following documents: passport, national ID, or drivering license for verification.',
            style: TextStyle(
              color: ColorResource.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              vertical: DimensionResource.marginSizeLarge),
          child: Text(
            controller
                .verifyPageDataList[controller.currentStep.value - 1].subTitle,
            style: StyleResource.instance
                .styleMedium(DimensionResource.fontSizeExtraLarge,
                    ColorResource.mainColor)
                .copyWith(height: 1.7, letterSpacing: .5),
          ),
        ),
        const SizedBox(
          height: DimensionResource.marginSizeExtraLarge + 20,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: DimensionResource.marginSizeLarge,
                  vertical: DimensionResource.marginSizeLarge),
              child: Text(
                controller.verifyPageDataList[controller.currentStep.value - 1]
                    .subTitle,
                style: StyleResource.instance
                    .styleMedium(DimensionResource.fontSizeExtraLarge,
                        ColorResource.mainColor)
                    .copyWith(height: 1.7, letterSpacing: .5),
              ),
            ),
            const SizedBox(
              height: DimensionResource.marginSizeExtraLarge + 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(typeList.length, (index) {
                var data = typeList.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    controller.selectedId.value = index;
                    selfieController.kycService
                        .submitKycIdType(data.name!, token)
                        .then((response) {
                      if (response.code != 200) {
                        toastShow(error: true, massage: response.message);
                      } else {
                        /// todo : upload id doc

                        controller.onDocumentScan();
                      }
                    });
                  },
                  child: controller.isInitialise.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: ColorResource.mainColor,
                        ))
                      : Card(
                          margin: const EdgeInsets.only(
                              bottom: DimensionResource.marginSizeExtraLarge),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: DimensionResource.marginSizeLarge,
                                vertical: DimensionResource.marginSizeDefault),
                            child: Row(
                              children: [
                                Container(
                                  height: 33,
                                  width: 33,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: ColorResource.mainColor,
                                          width: 2.5),
                                      color:
                                          controller.selectedId.value == index
                                              ? ColorResource.mainColor
                                              : ColorResource.white),
                                  child: Center(
                                      child: controller.selectedId.value ==
                                              index
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(ImageResource
                                                  .instance.checkIcon),
                                            )
                                          : Container()),
                                ),
                                const SizedBox(
                                  width: DimensionResource.marginSizeDefault,
                                ),
                                Text(
                                  data.name ?? "",
                                  style: StyleResource.instance
                                      .styleMedium(
                                          DimensionResource.fontSizeExtraLarge,
                                          ColorResource.mainColor)
                                      .copyWith(
                                        letterSpacing: .6,
                                      ),
                                )
                              ],
                            ),
                          )),
                );
              }),
            ),

            // Image.file(controller.selectedIdPic.value)
          ],
        ),
        // Visibility(
        //   visible: !controller.isInitialise.value,
        //   child: Container(
        //     color: Colors.white.withOpacity(0.4),
        //     child: const Center(
        //       child: CircularProgressIndicator(
        //         color: ColorResource.mainColor,
        //       ),
        //     )
        //   )
        // )
      ]);
    });
  }
}

class SelfieWidget extends GetView<VerificationController> {
  SelfieWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      logPrint("dfdfd ${controller.selectedIdPic.value.path}");
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              //vertical: DimensionResource.marginSizeExtraSmall
            ),
            child: Text(
              controller.verifyPageDataList[controller.currentStep.value - 1]
                  .subTitle,
              style: StyleResource.instance
                  .styleMedium(DimensionResource.fontSizeExtraLarge,
                      ColorResource.mainColor)
                  .copyWith(height: 1.7, letterSpacing: .5),
              textAlign: TextAlign.center,
            ),
          ),
          // const SizedBox(
          //   height: DimensionResource.margiLarge,
          // ),
          Container(
            height: Get.height * 0.35,
            width: Get.width * 0.55,
            margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(170, 220)),
            ),
            child: controller.selectSelfie.value.path == ""
                ? ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(170, 220)),
                    child:
                        cachedNetworkImage(ImageResource.instance.defaultUser))
                : ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(170, 220)),
                    child: Image.file(
                      controller.selectSelfie.value,
                      fit: BoxFit.cover,
                    )),
          )
        ],
      );
    });
  }
}

class VerificationProcessWidget extends GetView<VerificationController> {
  VerificationProcessWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              //vertical: DimensionResource.marginSizeExtraSmall
            ),
            child: Text(
              controller.verifyPageDataList[controller.currentStep.value - 1]
                  .subTitle,
              style: StyleResource.instance
                  .styleMedium(DimensionResource.fontSizeExtraLarge,
                      ColorResource.mainColor)
                  .copyWith(height: 1.7, letterSpacing: .5),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: DimensionResource.marginSizeExtraLarge + 20,
          ),
          Image.asset(
            controller.isVerified.value
                ? ImageResource.instance.checkCircleIcon
                : ImageResource.instance.rejectCircleIcon,
            height: 190,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              //vertical: DimensionResource.marginSizeExtraSmall
            ),
            child: Text(
              controller.isVerified.value
                  ? "If you want to purchase items using your credit, we will need some additional information to calcualte your credit score."
                  : "We couldnt capture your face. Watch out for poor lighting and blur",
              style: StyleResource.instance
                  .styleMedium(DimensionResource.fontSizeExtraLarge,
                      ColorResource.secondColor)
                  .copyWith(height: 1.7, letterSpacing: .5),
            ),
          ),
        ],
      );
    });
  }
}

class VerifyPage {
  final String title;
  final String subTitle;

  VerifyPage({required this.title, required this.subTitle});
}

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 33,
            width: 33,
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
                        child: Image.asset(ImageResource.instance.checkIcon),
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
          Expanded(
            child: Divider(
              color: stepSecondComplete
                  ? ColorResource.mainColor
                  : ColorResource.borderColor,
              thickness: 3,
              height: 0,
            ),
          ),
          Container(
            height: 33,
            width: 33,
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
          Expanded(
            child: Divider(
              color: stepThirdComplete
                  ? ColorResource.mainColor
                  : ColorResource.borderColor,
              thickness: 2,
              height: 0,
            ),
          ),
          Container(
            height: 33,
            width: 33,
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
          Expanded(
            child: Divider(
              color: stepFourthComplete
                  ? ColorResource.mainColor
                  : ColorResource.borderColor,
              thickness: 2,
              height: 0,
            ),
          ),
          Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: stepFourthComplete && currentStep >= 4
                        ? ColorResource.mainColor
                        : ColorResource.borderColor,
                    width: 6),
                color: ColorResource.mainColor),
            child: Center(
                child: stepFourthComplete && currentStep > 4
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
                              color: stepFourthComplete
                                  ? ColorResource.white
                                  : ColorResource.mainColor,
                              width: 3),
                          color: stepFourthComplete
                              ? ColorResource.mainColor
                              : ColorResource.white,
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
