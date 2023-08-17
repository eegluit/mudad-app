import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/models/add_credit_score_user_request_model.dart';
import '../../controller/home_controller.dart';
import '../../controller/personal_controller.dart';
import '../../model/utils/resource/color_resource.dart';
import '../../widget/text_field_view/common_textfield.dart';
import '../../widget/text_form_field_widget.dart';
import '../../widget/toast_view/showtoast.dart';
import 'bank_statement.dart';

class PersonalInfoPage extends GetView<PersonalController> {
  static const route = '/personlInfoPage';
  // static PersonalController personalController = Get.find<PersonalController>();
  static HomeController homeController = Get.find<HomeController>();
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                SvgPicture.asset('images/credit_progress2.svg'),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Text(
                  'Personal Info',
                  style: TextStyle(
                    color: ColorResource.mainColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            label: 'First Name',
                            controller: controller.fNameController.value,
                            keyboardType: TextInputType.text,
                            hintText: "'Your First Name, e.g : John'".tr,
                            validator: (value) {
                              if (value!.isEmpty) {
                                controller.fNameError.value =
                                    "Please enter your first name.".tr;
                                return "";
                              } else if (value.removeAllWhitespace == "") {
                                controller.fNameError.value =
                                    "Please enter valid name.".tr;
                                return null;
                              } else {
                                controller.fNameError.value = "";
                                return null;
                              }
                            },
                            errorText: controller.fNameError.value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            label: 'Last Name',
                            keyboardType: TextInputType.text,
                            controller: controller.lNameController.value,
                            hintText: 'Your Last Name, e.g :  Doe',
                            validator: (value) {
                              if (value!.isEmpty) {
                                controller.lNameError.value =
                                    "Please enter your last name.".tr;
                                return "";
                              } else if (value.removeAllWhitespace == "") {
                                controller.lNameError.value =
                                    "Please enter valid name.".tr;
                                return null;
                              } else {
                                controller.lNameError.value = "";
                                return null;
                              }
                            },
                            errorText: controller.lNameError.value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Gender',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => SizedBox(
                              width: Get.width,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.gender('m');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      decoration: controller.gender.value
                                                  .toLowerCase() ==
                                              'm'
                                          ? BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0xFFB9B7D1),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(146),
                                            )
                                          : const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                      child: const Text(
                                        'Male',
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.gender('f');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      decoration: controller.gender.value
                                                  .toLowerCase() ==
                                              'f'
                                          ? BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0xFFB9B7D1),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(146),
                                            )
                                          : const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                      child: const Text(
                                        'Female',
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                CommonTextField(
                                  label: 'Date of Birth',
                                  controller: controller.dobController.value,
                                  readOnly: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      controller.profError.value =
                                          "Please enter your Date of Birth.".tr;
                                      return "";
                                    } else if (value.removeAllWhitespace ==
                                        "") {
                                      controller.profError.value =
                                          "Please enter valid Date of Birth."
                                              .tr;
                                      return null;
                                    } else {
                                      controller.profError.value = "";
                                      return null;
                                    }
                                  },
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );

                                    if (pickedDate != null) {
                                      // Format the picked date as needed
                                      String formattedDate =
                                          "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                                      controller.dobController.value.text =
                                          formattedDate;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Choose',
                                      style: TextStyle(
                                        color: ColorResource.mainColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CommonTextField(
                            label: 'Profession',
                            keyboardType: TextInputType.text,
                            controller: controller.professionController.value,
                            hintText: 'Your Profession',
                            validator: (value) {
                              if (value!.isEmpty) {
                                controller.profError.value =
                                    "Please enter your profession.".tr;
                                return "";
                              } else if (value.removeAllWhitespace == "") {
                                controller.profError.value =
                                    "Please enter valid profession.".tr;
                                return null;
                              } else {
                                controller.profError.value = "";
                                return null;
                              }
                            },
                            errorText: controller.profError.value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            label: 'Employer',
                            keyboardType: TextInputType.text,
                            controller: controller.empolyerController.value,
                            hintText: 'Your Employer Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                controller.empNameError.value =
                                    "Please enter your employer name.".tr;
                                return "";
                              } else if (value.removeAllWhitespace == "") {
                                controller.empNameError.value =
                                    "Please enter valid name.".tr;
                                return null;
                              } else {
                                controller.empNameError.value = "";
                                return null;
                              }
                            },
                            errorText: controller.empNameError.value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            label: 'Employer Address',
                            keyboardType: TextInputType.text,
                            controller: controller.addressController.value,
                            hintText: 'Your Employer Address',
                            validator: (value) {
                              if (value!.isEmpty) {
                                controller.empAddError.value =
                                    "Please enter your employer address.".tr;
                                return "";
                              } else if (value.removeAllWhitespace == "") {
                                controller.empAddError.value =
                                    "Please enter valid address.".tr;
                                return null;
                              } else {
                                controller.empAddError.value = "";
                                return null;
                              }
                            },
                            errorText: controller.empAddError.value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            label: 'Monthly Income',
                            keyboardType: TextInputType.phone,
                            controller: controller.incomeController.value,
                            hintText: 'Your Monthly Base Salary',
                            validator: (value) {
                              if (value!.isEmpty) {
                                controller.incomeError.value =
                                    "Please enter your monthly income.".tr;
                                return "";
                              } else if (value.removeAllWhitespace == "") {
                                controller.incomeError.value =
                                    "Please enter valid income.".tr;
                                return null;
                              } else {
                                controller.incomeError.value = "";
                                return null;
                              }
                            },
                            errorText: controller.incomeError.value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: Get.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                ),
                              ),
                              onPressed: () {
                                // Get.offNamed(BankStatementPage.route);
                                if (controller.formKey.currentState
                                        ?.validate() ??
                                    false) {
                                  controller.isLoading(true);
                                  controller.creditService
                                      .createCreditUser(
                                          AddCreditScoreUserRequestModel(
                                              firstName: controller
                                                  .fNameController.value.text,
                                              lastName: controller
                                                  .lNameController.value.text,
                                              gender:
                                                  controller.gender.value == 'm'
                                                      ? 'Male'
                                                      : 'Female',
                                              dob: controller
                                                  .dobController.value.text,
                                              profession: controller
                                                  .professionController
                                                  .value
                                                  .text,
                                              employer: controller
                                                  .empolyerController
                                                  .value
                                                  .text,
                                              employerAddress: controller
                                                  .addressController.value.text,
                                              monthlyIncome: int.parse(
                                                  controller.incomeController
                                                      .value.text)),
                                          "ncHmszl6DXIVmsFdmQ4ZvfVeLCrWfi-IBX4w_RXnB2uKAzFuC74Xqg==")
                                      .then((response) {
                                    controller.isLoading(false);
                                    if (response.code != 200) {
                                      toastShow(
                                          error: true,
                                          massage: response.errorMessage);
                                      // Get.snackbar('Error', '${response.message}',
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //     backgroundColor: Colors.red,
                                      //     colorText: Colors.white);
                                    } else {
                                      homeController
                                          .setCreditToken(response.result!);
                                      toastShow(
                                          error: false,
                                          massage: "Personal info added!");
                                      // Get.snackbar('Success', '${response.message}',
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //     backgroundColor: Colors.green.shade600,
                                      //     colorText: Colors.white);
                                      controller.fNameController.value.clear();
                                      controller.lNameController.value.clear();
                                      controller.gender.value == '';
                                      controller.professionController.value
                                          .clear();
                                      controller.empolyerController.value
                                          .clear();
                                      controller.addressController.value
                                          .clear();
                                      controller.incomeController.value.clear();
                                      Get.offNamed(BankStatementPage.route);
                                    }
                                  });
                                }
                              },
                              child: Obx(
                                () => controller.isLoading.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Loading...',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ],
                                      )
                                    : const Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          return Visibility(
            visible: controller.isProfileLoading.value,
            child: Container(
              color: ColorResource.white.withOpacity(0.4),
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorResource.mainColor,
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  // bool validate(String fName, String lName, String gender, String profession,
  //     String employer, String address, String income) {
  //   if (fName.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter First Name",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } else if (lName.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter Last Name",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } else if (gender.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter Gender",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } else if (profession.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter Profession",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } else if (employer.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter Employer",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } else if (address.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter Employer Address",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } else if (income.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       "Please Enter Monthly Income",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   }
  //   return true;
  // }
}
