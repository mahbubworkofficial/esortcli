import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiController extends GetxController with GetSingleTickerProviderStateMixin {
  final RxBool isActive = false.obs;
  late AnimationController _controller;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void toggleMic() {
    isActive.value = !isActive.value;
    if (isActive.value) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}