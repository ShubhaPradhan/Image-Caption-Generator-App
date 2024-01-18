import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_caption_generator/app/modules/home/home_controller.dart';
import 'package:image_caption_generator/app/widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/custom_error.dart';
import '../../widgets/custom_image_picker.dart';

class HomeView extends StatelessWidget {
  final homeController = Get.put(HomeController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: Adaptive.w(42),
                  child: CustomImagePicker(
                    color: Colors.white,
                    onPressed: () async {
                      // pick image
                      await homeController.captureImage();
                    },
                    text: "Take Picture",
                    check: homeController.pickedImage.value.path.toString(),
                    controller: homeController.pickedImage.value,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Adaptive.w(42),
                  child: CustomImagePicker(
                    color: Colors.white,
                    onPressed: () async {
                      // pick image
                      await homeController.pickPhotos('council');
                    },
                    check: homeController.pickedImage.value.path.toString(),
                    controller: homeController.pickedImage.value,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 20.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: homeController.pickedImage.value.path.toString() == 'empty'
                  ? SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Image.asset(
                          'assets/images/image.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Image.file(
                      homeController.pickedImage.value,
                    ),
            ),
            homeController.isImageError.value
                ? CustomError(
                    text: 'Please upload a photo'.tr,
                  )
                : const SizedBox(),
            CustomElevatedButton(
              onPressed: () {
                homeController.onSubmit();
              },
              text: "Generate Caption",
              width: double.infinity,
              height: 6.h,
              borderRadius: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
