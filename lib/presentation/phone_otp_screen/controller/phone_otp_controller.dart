import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/auth/data/repositories/auth_repository.dart';

/// Controller for phone OTP authentication flow.
class PhoneOtpController extends GetxController {
  PhoneOtpController(this._authRepository);

  final AuthRepository _authRepository;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final isLoading = false.obs;
  final isCodeSent = false.obs;

  String? _verificationId;
  int? _resendToken;

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }

  Future<void> sendOtp({bool forceResend = false}) async {
    final phone = phoneController.text.trim();
    if (phone.isEmpty || !phone.startsWith('+')) {
      Get.snackbar('Invalid phone', 'Use E.164 format, e.g. +919876543210');
      return;
    }

    isLoading.value = true;

    await _authRepository.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      forceResendingToken: forceResend ? _resendToken : null,
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
        } on FirebaseAuthException catch (e) {
          Get.snackbar('Auto verify failed', e.message ?? 'Please enter OTP.');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('OTP failed', e.message ?? 'Unable to send OTP.');
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _resendToken = resendToken;
        isCodeSent.value = true;
        Get.snackbar('OTP sent', 'Verification code sent successfully.');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );

    isLoading.value = false;
  }

  Future<void> verifyOtp() async {
    final code = otpController.text.trim();
    if ((_verificationId ?? '').isEmpty || code.length < 6) {
      Get.snackbar('Invalid OTP', 'Enter a valid 6-digit code.');
      return;
    }

    isLoading.value = true;
    try {
      await _authRepository.verifyOtpAndSignIn(
        verificationId: _verificationId!,
        smsCode: code,
      );
      Get.back();
      Get.snackbar('Success', 'Phone verified successfully.');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Verification failed', e.message ?? 'Invalid OTP.');
    } finally {
      isLoading.value = false;
    }
  }
}
