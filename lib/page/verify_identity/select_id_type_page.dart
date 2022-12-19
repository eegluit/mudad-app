import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/take_selfie_controller.dart';
import '../../models/select_type_model.dart';
import 'take_selfie.dart';

class SelectIdTypePage extends StatelessWidget {
  static const route = '/selectIdtypePage';
  static TakeSelfieController selfieController =
      Get.find<TakeSelfieController>();
  const SelectIdTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var typeId = 0.obs;
    List<SelectTypeModel> typeList = [
      SelectTypeModel(
        id: 1,
        name: "Passport",
      ),
      SelectTypeModel(
        id: 2,
        name: "ID Card",
      ),
      SelectTypeModel(
        id: 3,
        name: "Drivers License",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          Image.asset('images/progress1.png'),
          SizedBox(
            height: Get.height * 0.05,
          ),
          const Text(
            'Select ID Type',
            style: TextStyle(
              color: Color(0xFF651F6B),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 40),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: typeList.length,
              itemBuilder: (BuildContext context, int index) {
                var data = typeList.elementAt(index);
                return Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Card(
                      elevation: 10,
                      child: RadioListTile<int>(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: const VisualDensity(
                          vertical: VisualDensity.minimumDensity,
                        ),
                        title: Text("${data.name}"),
                        groupValue: typeId.value,
                        value: data.id!,
                        onChanged: (val) {
                          selfieController.imagePicker();
                          typeId.value = val!;
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.25,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 28,
              right: 28,
            ),
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
                Get.toNamed(TakeSelfiePage.route);
                Get.delete<TakeSelfieController>();
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
