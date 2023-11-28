import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';

class SignupController extends GetxController {
  final AuthService authService = Get.find();

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future signUp() async {
    try {
      loading.value = true;
      await authService.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      log('Sign up failed: $e');
      rethrow;
    } finally {
      loading.value = false;
    }
  }
}
