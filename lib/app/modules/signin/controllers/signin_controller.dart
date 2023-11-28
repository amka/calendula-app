import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';

class SigninController extends GetxController {
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

  Future signIn() async {
    try {
      loading.value = true;
      await authService.signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      log('Sign in failed: $e');
      rethrow;
    } finally {
      loading.value = false;
    }
  }
}
