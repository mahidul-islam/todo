import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorNotification extends GetxService {
  static ErrorNotification get to => Get.find();

  void show({required final String error}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      'Error',
      error,
      backgroundColor: Colors.redAccent.withOpacity(0.9),
      duration: 4.seconds,
      icon: const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      colorText: Colors.white,
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: const Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
