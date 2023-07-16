import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../service/kyc_service.dart';

class TakeSelfieController extends GetxController {
  var photo = XFile('').obs;
  var kycService = KycService();

  void imagePicker() async {
    var picker = ImagePicker();
    // Capture a photo
    await picker.pickImage(source: ImageSource.camera, imageQuality: 90).then((value) {
      if(value != null) {
        photo.value = value;
      }
    });
  }
}
