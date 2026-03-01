import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repositories/auth_repository.dart';

/// Controller for user registration flow.
class SignupController extends GetxController {
  SignupController(this._authRepository);

  final AuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> signup() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    try {
      await _authRepository.signUpWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.back();
      Get.snackbar('Success', 'Account created successfully.');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Sign up failed', e.message ?? 'Unable to create account.');
    } catch (_) {
      Get.snackbar('Sign up failed', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
