import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mudad/widget/base_view/base_view.dart';

import '../utils/utils/resource/color_resource.dart';
import '../utils/utils/resource/dimensions_resource.dart';
import '../utils/utils/resource/image_resource.dart';
import '../utils/utils/resource/style_resource.dart';

class Transactionpage extends StatelessWidget {
  static const route = '/TransactionPage';
  const Transactionpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.mainColor,
      appBar: AppBar(
        backgroundColor: ColorResource.mainColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            ImageResource.instance.transactionIcon,
            color: ColorResource.white,
          ),
        ),
        title: const Text(
          "All Transactions",
          style: TextStyle(
            color: ColorResource.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        height: Get.height-165,
        margin: const EdgeInsets.only(top: DimensionResource.marginSizeLarge),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, -2.0),
              blurRadius: 8,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.only(left: DimensionResource.marginSizeLarge,right: DimensionResource.marginSizeLarge,top: index == 0? DimensionResource.marginSizeLarge:0,bottom: index == 11? DimensionResource.marginSizeLarge:0),
                child: _buildTransactionRowUi(
                    backGroundColor: index.isOdd?ColorResource.transactionColor:ColorResource.white,
                    transactionDateAndTime: "March 12, 06:30 pm",
                    amount: "+RO 100",
                    transactionTitle: "Recived from Customer "
                ),
              );
            }),
      ),
    );

  }
  Widget _buildTransactionRowUi({required Color backGroundColor,required String transactionTitle,required  String transactionDateAndTime,required String amount}){
    return Container(
      margin:const EdgeInsets.only(bottom: 10),
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backGroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorResource.secondColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(ImageResource.instance.walletIcon,color: ColorResource.white,),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transactionTitle,style: StyleResource.instance.styleMedium(DimensionResource.fontSizeExtraLarge, ColorResource.black),),
                const SizedBox(height: 5,),
                Text(transactionDateAndTime,style: StyleResource.instance.styleRegular(DimensionResource.fontSizeDefault, ColorResource.textColor),),

              ],
            ),
          ),
          const SizedBox(width: 10,),
          Text(amount,style: StyleResource.instance.styleMedium(DimensionResource.fontSizeLarge, ColorResource.darkGreenColor),),


        ],
      ),

    );
  }

}
