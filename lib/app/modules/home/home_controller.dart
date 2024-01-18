import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/result.dart';

class HomeController extends GetxController {
  final pickedImage = File('empty').obs;
  final picker = ImagePicker();
  final isImageError = false.obs;
  Future pickPhotos() async {
    final pickedImg = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImg != null) {
      pickedImage.value = File(pickedImg.path);
    }
  }

  // camera image picker
  Future captureImage() async {
    final pickedImg = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedImg != null) {
      pickedImage.value = File(pickedImg.path);
    }
  }

  bool customValidations() {
    isImageError.value = false;

    if (pickedImage.value.path == 'empty') {
      isImageError.value = true;
    }

    return isImageError.value;
  }

  void onSubmit() {
    if (customValidations()) {
      log('error');
      return;
    }

    sendImageToServer();
  }

  void sendImageToServer() async {
    log('sending image to server');
    Get.to(() => const Result());
  }
}
