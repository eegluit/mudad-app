import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:get/get.dart';
import 'package:mudad/page/verify_identity/verification_pending_page.dart';
import 'package:mudad/widget/log_print/log_print_condition.dart';
import 'package:mudad/widget/toast_view/showtoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_face_api/face_api.dart' as Regula;

import '../../model/services/auth_service.dart';
import '../../page/home/verification_view/verification_view.dart';
import '../../widget/image_picker/image_selection_util.dart';
import '../../page/home/home_page.dart';
import '../take_selfie_controller.dart';

class VerificationController extends GetxController {
  RxInt currentStep = 1.obs;
  RxInt selectedId = (-1).obs;
  RxBool isVerified = true.obs;

  Rx<io.File> selectedIdPic = io.File("").obs;
  Rx<io.File> selectSelfie = io.File("").obs;
  List<VerifyPage> verifyPageDataList = <VerifyPage>[
    VerifyPage(
        title: "Verify Your Identity",
        subTitle: "Simply use your phone camera to capture the following: "),

    VerifyPage(title: "Upload ID", subTitle: ""),


    VerifyPage(
        title: "Take a Selfie",
        subTitle:
            "Place your face inside the oval and press start when you are ready"),
    VerifyPage(title: "Verification\nProcess ", subTitle: ""),
  ];
  RxBool isInitialise = false.obs;
  RxMap<String,dynamic> documentMap = <String,dynamic>{}.obs;
Rx<Uint8List> imageUint8ListData = Uint8List(0).obs;
  late ImageSelectionUtil imageSelectionUtils =

      ImageSelectionUtil((String base64Image, io.File imageFiles) async {
    if (currentStep.value == 2) {
      selectedIdPic.value = imageFiles;
    } else {
      selectSelfie.value = imageFiles;
    }
  });

  openSelfieCamera() {
    //imageSelectionUtils.pickImageViaCamera();
    liveness();
  }

  onDocumentScan() {
    DocumentReader.showScanner().then((value) {
      log("val $value");

    });
  }

  onVerifyIdentity() {
    currentStep.value = 2;
  }

  onSelectId() {
    currentStep.value = 3;
   // openSelfieCamera();
   //  liveness();
  }

  liveness() {
    logPrint("face sdk error ");
    try{
      Regula.FaceSDK.startLiveness().then((value) async {
        //log("facesdk result ${value}");
        var result = Regula.LivenessResponse.fromJson(json.decode(value));
        if (result!.bitmap == null) return;
        //log("facesdk result ${result?.bitmap}");
         //setImage(base64Decode(result.bitmap!.replaceAll("\n", "")));
         imageUint8ListData.value = base64Decode(result.bitmap!.replaceAll("\n", ""));
        log("imageUint8ListData ${imageUint8ListData.value}");
       try{
         io.Directory path = await getApplicationDocumentsDirectory();
         log("imageUint8ListData path ${path}");
         io.File("${path.path}/${DateTime.now().millisecondsSinceEpoch}.png").writeAsBytes(imageUint8ListData.value).then((value) {
           logPrint("valaue image ${value.path}");
           selectSelfie.value = value;
         });
       }catch(e){
         logPrint("error $e");
       }
        // setState(() => _liveness =
        // result.liveness == Regula.LivenessStatus.PASSED
        //     ? "passed"
        //     : "unknown");
      }).onError((error, stackTrace) {
        logPrint("face sdk error $error");
      });
    }catch(e){
      log("startLiveness $e");
    }
  }

  onTakeSelfie() {
    if (selectSelfie.value.path == "") {
      openSelfieCamera();
    } else {
      currentStep.value = 4;
    }
  }

  onVerificationComplete() {
    Get.offAllNamed(VerificationPendingPage.route);
  }

  onSkipNowButton() {
    saveImage();
  }

  RxString selectedScenario = "FullProcess".obs;

  Future<void> initPlatformState() async {
    isInitialise.value = false;

    DocumentReader.prepareDatabase("Full").then((s) {
      // do something
    }).catchError((Object error) =>
        log("error rer ${(error as PlatformException).message ?? ""}"));
    log("Initializing...");
    ByteData byteData = await rootBundle.load("assets/regula.license");

    DocumentReader.initializeReader({
      "license": base64.encode(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
      "delayedNNLoad": true
    }).then((s) {
      log(s);
      isInitialise.value = true;
    }).catchError((Object error) async {
      log((error as PlatformException).message ?? "");
      log("error rer ${(error as PlatformException).message ?? ""}");
    });

    log("Ready");

    await DocumentReader.setConfig({
      "functionality": {
        "videoCaptureMotionControl": true,
        "showCaptureButton": true
      },
      "customization": {
        "showResultStatusMessages": true,
        "showStatusMessages": true
      },
      "processParams": {
        "scenario": selectedScenario.value,
        "doublePageSpread": true
      }
    });

    List<List<String>> scenarios = [];
    var scenariosTemp =
        json.decode(await DocumentReader.getAvailableScenarios());
    for (var i = 0; i < scenariosTemp.length; i++) {
      DocumentReaderScenario scenario = DocumentReaderScenario.fromJson(
          scenariosTemp[i] is String
              ? json.decode(scenariosTemp[i])
              : scenariosTemp[i])!;
      log("scenariosTemp ${scenario.name}");
      scenarios.add([scenario.name!, scenario.caption!]);
    }

    Regula.FaceSDK.init().then((json) {
      var response = jsonDecode(json);
      if (!response["success"]) {
        print("Init failed: ");
        print(json);
      }
    });

    // const EventChannel('flutter_face_api/event/livenessNotification')
    //     .receiveBroadcastStream()
    //     .listen((event) {
    //   var notification =
    //   Regula.LivenessNotification.fromJson(json.decode(event));
    //   print("LivenessProcessStatus: ${notification!.status}");
    // });
  }

  Rx<Regula.MatchFacesImage> image1 = Regula.MatchFacesImage().obs;
  Rx<Image> img1 = Image.asset('assets/images/portrait.png').obs;


  setImage( Uint8List? imageFile) async {
   try{
     io.File(await getDirectoryPath()).writeAsBytes(imageFile!).then((value) {
       logPrint("valaue image ${value.path}");
       selectSelfie.value = value;
     });
   }catch(e){
     logPrint("valaue image error $e");
   }
  }

  saveImage() async {
    TakeSelfieController selfieController =
    Get.find<TakeSelfieController>();
    var token = Get.find<AuthServices>().getUserToken();
    selfieController.kycService
        .submitKycSelfie(
        selectSelfie.value,
        token)
        .then((response) {
          logPrint("response ${response.toJson()}");
      if (response.code != 200) {
        toastShow(
            error: true,
            massage: response.message);
      } else {
        currentStep.value = 4;
        //controller.onSelectId();
      }
    });
  }

  Future<String> getDirectoryPath()async{
    Directory tempDir = await getApplicationDocumentsDirectory();

   // Directory path = Directory('${tempDir.path}/${DateTime.now().millisecond}.png');

    /// if folder exists in four phone memory.
    if ((await tempDir.exists())) {
    //download call
    return tempDir.path;
    } else {
    /// Create folder in your memory.
    Directory? newPath = await tempDir.create();
    return newPath.path;
    }
  }

  runAutoUpdate() {
    DocumentReader.runAutoUpdate("Full").then((s) {
      // do something
    }).catchError(
        (Object error) => print((error as PlatformException).message));
  }

  @override
  void onInit() {
    runAutoUpdate();
    initPlatformState();
    const EventChannel('flutter_document_reader_api/event/completion')
        .receiveBroadcastStream()
        .listen((jsonString) => handleCompletion(
        DocumentReaderCompletion.fromJson(json.decode(jsonString)) ??
            DocumentReaderCompletion()));
    super.onInit();
  }

  void handleCompletion(DocumentReaderCompletion completion) {
    //handleResults(completion.results!);
    log("status ${completion.action}");
    if (completion.action == DocReaderAction.COMPLETE) {
      handleResults(completion.results!);
    } else if (completion.action == DocReaderAction.CANCEL) {
      toastShow(massage: "Cancelled");
    } else if (completion.action == DocReaderAction.TIMEOUT) {
      toastShow(massage: "Timeout !!! Please try again");
    } else if (completion.action == DocReaderAction.ERROR) {
      toastShow(massage: " ${completion.error?.message ?? ""}");
    }
  }

  Future<void> handleResults(DocumentReaderResults results) async {
    log("DocumentReaderResults ${results.rawResult}");
    log("DocumentReaderResults ${results.authenticityResult}");
if(results != null){
  // Get surname
  String? surname = results.getTextFieldValueByType(EVisualFieldType.FT_SURNAME, source: ERPRMResultType.RPRM_RESULT_TYPE_VISUAL_OCR_EXTENDED, original: true);
// Get address
  String? address = results.getTextFieldValueByType(EVisualFieldType.FT_ADDRESS,source: ERPRMResultType.RPRM_RESULT_TYPE_BAR_CODES_TEXT_DATA, original: true);
log("surname $surname");
log("address $address");
}

results.graphicFieldImageByType(EGraphicFieldType.GF_DOCUMENT_IMAGE).then((value) {
  //log("image Get ${value?.path.}");
  try{

   // log("converted image $image");
  }catch(e){
    log("error r $e");
  }

});


    for(DocumentReaderGraphicField? graphicsField in results.graphicResult?.fields??[]){
      log("graphicsField ${graphicsField?.toJson()}");

      log("graphicsField  ${(graphicsField?.fieldName??"") + ', value: ' + (graphicsField?.value??"") + ', source: '}");
      documentMap.clear();
      if((graphicsField?.fieldName??"") == "Document image"){
        //Uint8List image = base64Decode((graphicsField?.value??"").replaceAll("\n", ""));
       // documentMap.addAll({"document_image" : image});
        Uint8List image = base64Decode((graphicsField?.value??"").replaceAll("\n", ""));
        //log("imageUint8ListData ${imageUint8ListData.value}");
        try{
          io.Directory path = await getApplicationDocumentsDirectory();
          log("imageUint8ListData path ${path}");
          io.File("${path.path}/${DateTime.now().millisecondsSinceEpoch}.png").writeAsBytes(image).then((value) {
            logPrint("valaue image ${value.path}");
            selectedIdPic.value = value;
          });
        }catch(e){
          logPrint("error $e");
        }
        // log("pathOfImage $pathOfImage");
        // final Uint8List bytes = pathOfImage..buffer.asUint8List();
        // await pathOfImage.writeAsBytes(bytes);
      }
    }

    for (var textField in results.textResult?.fields??[]) {
      for (var value in textField.values) {
        log(textField.fieldName +
            ', value: ' +
            value.value +
            ', source: ' +
            value.sourceType.toString());
        documentMap.addAll({textField.fieldName : value.value});
      }
    }
    log("documentMap ${documentMap.toString()}");
    log("ducument json $documentMap");
    if(documentMap.isNotEmpty){
      currentStep.value = 2;
    }
  }
}
