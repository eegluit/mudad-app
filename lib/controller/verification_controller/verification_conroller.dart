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
import '../take_selfie_controller.dart';

class VerificationController extends GetxController {
  RxInt currentStep = 1.obs;
  RxInt selectedId = (-1).obs;
  RxBool isVerified = true.obs;

  RxBool isDocumentScanned = false.obs;
  var portraitImage = Image.asset('assets/images/portrait.png');
  var docImage = Image.asset('assets/images/id.png');

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
  RxMap<String, dynamic> documentMap = <String, dynamic>{}.obs;
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
    var config = new ScannerConfig();
    config.scenario = "DocType";
    DocumentReader.scan(config.toJson());
// DocumentReader.showScanner().then((value) {
// log("val $value");
// });
  }

  onVerifyIdentity() {
    currentStep.value = 2;
  }

  onSelectId() {
    currentStep.value = 3;
// openSelfieCamera();
// liveness();
  }

  liveness() {
    try {
      Regula.FaceSDK.startLiveness().then((value) async {
//log("facesdk result ${value}");
        var result = Regula.LivenessResponse.fromJson(json.decode(value));
        if (result!.bitmap == null) return;
//log("facesdk result ${result?.bitmap}");
//setImage(base64Decode(result.bitmap!.replaceAll("\n", "")));
        imageUint8ListData.value =
            base64Decode(result.bitmap!.replaceAll("\n", ""));
        log("imageUint8ListData ${imageUint8ListData.value}");
        try {
          io.Directory path = await getApplicationDocumentsDirectory();
          log("imageUint8ListData path ${path}");
          io.File("${path.path}/${DateTime.now().millisecondsSinceEpoch}.png")
              .writeAsBytes(imageUint8ListData.value)
              .then((value) {
            logPrint("valaue image ${value.path}");
            selectSelfie.value = value;
          });
        } catch (e) {
          logPrint("error $e");
        }
// setState(() => _liveness =
// result.liveness == Regula.LivenessStatus.PASSED
// ? "passed"
// : "unknown");
      }).onError((error, stackTrace) {
        logPrint("face sdk error $error");
      });
    } catch (e) {
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
// DocumentReader.prepareDatabase("Full").then((s) {
// }).catchError((Object error) =>
// log("error rer ${(error as PlatformException).message ?? ""}"));
// log("Initializing...");
// ByteData byteData = await rootBundle.load("assets/regula.license");

// DocumentReader.initializeReader({
// "license": base64.encode(byteData.buffer
// .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
// "delayedNNLoad": true
// }).then((s) {
// log(s);
// isInitialise.value = true;
// }).catchError((Object error) async {
// log((error as PlatformException).message ?? "");
// log("error rer ${(error as PlatformException).message ?? ""}");
// });

    DocumentReader.prepareDatabase("Full").then((s) {
      // do something
    }).catchError((Object error) => print(
        "************************ERROR REGULA ${(error as PlatformException).message ?? ""}"));
    ByteData byteData = await rootBundle.load("assets/regula.license");
    DocumentReader.initializeReader({
      "license": base64.encode(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
      "delayedNNLoad": true
    }).then((s) {
      log(s);
      print('************************RESPONSE REGULA1');

      //isInitialise.value = true;
    }).catchError((Object error) async {
      logPrint((error as PlatformException).message ?? "");
      logPrint(
          "************************ERROR REGULA3 ${(error as PlatformException).message ?? ""}");
    });

    // print(await DocumentReader.prepareDatabase("Full"));
    isInitialise.value = false;
    // print(await DocumentReader.initializeReader({
    //   "license": base64.encode(byteData.buffer
    //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
    //   "delayedNNLoad": true
    // }));

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
        "doublePageSpread": false,
        "timeout": 30.0,
        "timeoutFromFirstDetect": 30.0,
        "timeoutFromFirstDocType": 30.0
      }
    });

    Regula.FaceSDK.init().then((json) {
      var response = jsonDecode(json);
      if (!response["success"]) {
        print("Init failed: ");
        print(json);
      }
    });

// const EventChannel('flutter_face_api/event/livenessNotification')
// .receiveBroadcastStream()
// .listen((event) {
// var notification =
// Regula.LivenessNotification.fromJson(json.decode(event));
// print("LivenessProcessStatus: ${notification!.status}");
// });
  }

  Rx<Regula.MatchFacesImage> image1 = Regula.MatchFacesImage().obs;
  Rx<Image> img1 = Image.asset('assets/images/portrait.png').obs;

  setImage(Uint8List? imageFile) async {
    try {
      io.File(await getDirectoryPath()).writeAsBytes(imageFile!).then((value) {
        logPrint("valaue image ${value.path}");
        selectSelfie.value = value;
      });
    } catch (e) {
      logPrint("valaue image error $e");
    }
  }

  saveImage() async {
    TakeSelfieController selfieController = Get.find<TakeSelfieController>();
    var token = Get.find<AuthServices>().getUserToken();
    selfieController.kycService
        .submitKycSelfie(selectSelfie.value, token)
        .then((response) {
      logPrint("response ${response.toJson()}");
      if (response.code != 200) {
        toastShow(error: true, massage: response.message);
      } else {
        currentStep.value = 4;
//controller.onSelectId();
      }
    });
  }

  Future<String> getDirectoryPath() async {
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

// runAutoUpdate() {
// DocumentReader.runAutoUpdate("Full").then((s) {
// // do something
// }).catchError(
// (Object error) => print((error as PlatformException).message));
// }

// @override
// void onClose() {
// // TODO: implement onClose
// DocumentReader.removeDatabase().then((str) {
// print('Removed');
// }).catchError(
// (Object error) => print((error as PlatformException).message));

// DocumentReader.cancelDBUpdate().then((str) {
// print('Cancelled');
// }).catchError(
// (Object error) => print((error as PlatformException).message));
// super.onClose();
// }

  @override
  void onInit() {
    print("ABCD on INIT");
    super.onInit();
// runAutoUpdate();
    initPlatformState();
    const EventChannel('flutter_document_reader_api/event/completion')
        .receiveBroadcastStream()
        .listen((jsonString) => this.handleCompletion(
            DocumentReaderCompletion.fromJson(json.decode(jsonString))!));
  }

  void handleCompletion(DocumentReaderCompletion completion) {
    if (completion.action == DocReaderAction.COMPLETE) {
      handleResults(completion.results!);
    } else if (completion.action == DocReaderAction.CANCEL) {
      toastShow(massage: "DocumentReaderResults Cancelled");
    } else if (completion.action == DocReaderAction.TIMEOUT) {
      print("DocumentReaderResults Timeout !!! Please try again");
    } else if (completion.action == DocReaderAction.ERROR) {
      toastShow(
          massage: "DocumentReaderResults ${completion.error?.message ?? ""}");
    }
  }

  void handleResults(DocumentReaderResults results) {
    displayResults(results);
  }

  displayResults(DocumentReaderResults results) async {
    var name = await results
        .textFieldValueByType(EVisualFieldType.FT_SURNAME_AND_GIVEN_NAMES);
    var docName = await results
        .graphicFieldImageByType(EGraphicFieldType.GF_DOCUMENT_IMAGE);
    var portraitName =
        await results.graphicFieldImageByType(EGraphicFieldType.GF_PORTRAIT);
    if (docName != null) {
      docImage = Image.memory(docName.data!.contentAsBytes());
    }
    if (portraitName != null) {
      portraitImage = Image.memory(portraitName.data!.contentAsBytes());
    }
    isDocumentScanned.value = true;
    currentStep.value = 2;
// setState(() {
// _status = name ?? "";
// _docImage = Image.asset('assets/images/id.png');
// _portrait = Image.asset('assets/images/portrait.png');
// if (doc != null) _docImage = Image.memory(doc.data!.contentAsBytes());
// if (portrait != null)
// _portrait = Image.memory(portrait.data!.contentAsBytes());
// });
  }

// Future<void> handleResults(DocumentReaderResults results) async {
// log("DocumentReaderResults ${results.rawResult}");
// log("DocumentReaderResults ${results.authenticityResult}");
// if (results != null) {
// // Get surname
// String? surname =
// await results.textFieldValueByType(EVisualFieldType.FT_SURNAME);
// // Get address
// String? address =
// await results.textFieldValueByType(EVisualFieldType.FT_ADDRESS);
// log("DocumentReaderResults surname $surname");
// log("DocumentReaderResults address $address");
// }

// results
// .graphicFieldImageByType(EGraphicFieldType.GF_DOCUMENT_IMAGE)
// .then((value) {
// //log("image Get ${value?.path.}");
// try {
// // log("converted image $image");
// } catch (e) {
// log("error r $e");
// }
// });

// for (DocumentReaderGraphicField? graphicsField
// in results.graphicResult?.fields ?? []) {
// log("graphicsField ${graphicsField?.toJson()}");

// log("graphicsField ${(graphicsField?.fieldName ?? "") + ', value: ' + (graphicsField?.value ?? "") + ', source: '}");
// documentMap.clear();
// if ((graphicsField?.fieldName ?? "") == "Document image") {
// //Uint8List image = base64Decode((graphicsField?.value??"").replaceAll("\n", ""));
// // documentMap.addAll({"document_image" : image});
// Uint8List image =
// base64Decode((graphicsField?.value ?? "").replaceAll("\n", ""));
// //log("imageUint8ListData ${imageUint8ListData.value}");
// try {
// io.Directory path = await getApplicationDocumentsDirectory();
// log("imageUint8ListData path ${path}");
// io.File("${path.path}/${DateTime.now().millisecondsSinceEpoch}.png")
// .writeAsBytes(image)
// .then((value) {
// logPrint("valaue image ${value.path}");
// selectedIdPic.value = value;
// });
// } catch (e) {
// logPrint("error $e");
// }
// // log("pathOfImage $pathOfImage");
// // final Uint8List bytes = pathOfImage..buffer.asUint8List();
// // await pathOfImage.writeAsBytes(bytes);
// }
// }

// for (var textField in results.textResult?.fields ?? []) {
// for (var value in textField.values) {
// log(textField.fieldName +
// ', value: ' +
// value.value +
// ', source: ' +
// value.sourceType.toString());
// documentMap.addAll({textField.fieldName: value.value});
// }
// }
// log("documentMap ${documentMap.toString()}");
// log("ducument json $documentMap");
// if (documentMap.isNotEmpty) {
// currentStep.value = 2;
// }
// }
}
