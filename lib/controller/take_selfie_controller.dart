import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TakeSelfieController extends GetxController {
  var photo = XFile('').obs;

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
