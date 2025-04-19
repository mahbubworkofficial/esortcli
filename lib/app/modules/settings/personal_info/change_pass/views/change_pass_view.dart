import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_pass_controller.dart';

class ChangePassView extends GetView<ChangePassController> {
  const ChangePassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangePassView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChangePassView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
