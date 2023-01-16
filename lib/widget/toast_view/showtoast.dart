import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/utils/resource/color_resource.dart';

toastShow({String ?massage, bool ?error}){
  return  Fluttertoast.showToast(
      msg: massage??"Something wrong here.",
      gravity : ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: error==false? ColorResource.mainColor : ColorResource.errorColor,
      textColor: ColorResource.white,
      fontSize: 12.0
  );
}