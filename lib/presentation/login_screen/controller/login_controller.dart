import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/auth/data/repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';

/// Controller for email/password login flow.
class LoginController extends GetxController {
  LoginController(this._authRepository);

  final AuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    try {
      await _authRepository.signInWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login failed', e.message ?? 'Unable to login right now.');
    } catch (_) {
      Get.snackbar('Login failed', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  void goToSignup() => Get.toNamed(AppRoutes.signupScreen);

  void goToPhoneOtp() => Get.toNamed(AppRoutes.phoneOtpScreen);
}
