import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../models/vendor_category_model.dart';

class VendorsPage extends GetView<HomeController> {
  const VendorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = <VendorCategoryModel>[
      VendorCategoryModel(
        name: 'Food',
        image: 'images/food.svg',
      ),
      VendorCategoryModel(
        name: 'Apperal',
        image: 'images/apperal.svg',
      ),
      VendorCategoryModel(
        name: 'Beauty',
        image: 'images/beauty.svg',
      ),
      VendorCategoryModel(
        name: 'Home',
        image: 'images/home_solid.svg',
      ),
      VendorCategoryModel(
        name: 'Sports',
        image: 'images/sports.svg',
      ),
      VendorCategoryModel(
        name: 'Health',
        image: 'images/health.svg',
      ),
      VendorCategoryModel(
        name: 'Grocery',
        image: 'images/grocery.svg',
      ),
      VendorCategoryModel(
        name: 'Technology',
        image: 'images/technology.svg',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'images/vendors.svg',
          ),
        ),
        title: const Text(
          'Vendors',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            margin: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF1F276B),
                  offset: Offset(0, -5.0),
                  blurRadius: 13,
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 34,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFACB1C6),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Search',
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 18,
                            minWidth: 18,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: SvgPicture.asset(
                              'images/search.svg',
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Color(0xFf949494),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    SvgPicture.asset('images/filter_icon.svg'),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 34,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 23,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFDDDDDD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                color: Color(0xFF5F6369),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset('images/arrow_bottom.svg'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFDDDDDD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Vendor',
                              style: TextStyle(
                                color: Color(0xFF5F6369),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset('images/arrow_bottom.svg'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFDDDDDD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: const Text(
                          'Newly Added',
                          style: TextStyle(
                            color: Color(0xFF5F6369),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                  ),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xFF30324B),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: Color(0xFFCACACA),
                  height: 1,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    //reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF641F6B),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('${category.elementAt(index).image}'),
                            Text(
                              '${category.elementAt(index).name}',
                              style: const TextStyle(
                                color: Color(0xFF651F6B),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Vendors',
                      style: TextStyle(
                        color: Color(0xFF30324B),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF1F276B),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: Color(0xFFCACACA),
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF1E2668),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            child: SvgPicture.asset(
                              'images/scan_icon.svg',
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            color: const Color(0xFF1E2668),
                            child: const Text(
                              'View Location',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
