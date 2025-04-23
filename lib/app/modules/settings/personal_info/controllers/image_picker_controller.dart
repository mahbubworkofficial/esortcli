import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> getImage(ImageSource source) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      imagePath.value = '';

      bool hasPermission = await _requestPermission(source);
      if (!hasPermission) {
        errorMessage.value = 'Permission denied for ${source == ImageSource.camera ? 'camera' : 'gallery'} access.';
        Get.snackbar(
          'Permission Denied',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
        return;
      }

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxHeight: 1024,
        maxWidth: 1024,
        imageQuality: 80,
      );

      if (image != null) {
        imagePath.value = image.path;
        Get.snackbar(
          'Success',
          'Image selected successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        errorMessage.value = 'No image selected.';
        Get.snackbar(
          'Cancelled',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      errorMessage.value = 'Error selecting image: $e';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> _requestPermission(ImageSource source) async {
    PermissionStatus status;

    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
    } else {
      if (GetPlatform.isIOS) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.storage.request();
      }
    }

    return status.isGranted;
  }
}
