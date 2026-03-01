import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/phone_otp_controller.dart';

/// Phone OTP screen for SMS-based authentication.
class PhoneOtpScreen extends GetWidget<PhoneOtpController> {
  const PhoneOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with OTP')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '+919876543210',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.sendOtp(),
                child: const Text('Send OTP'),
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => controller.isCodeSent.value
                  ? Column(
                      children: [
                        TextField(
                          controller: controller.otpController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'OTP Code',
                            hintText: '6-digit code',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.verifyOtp,
                          child: const Text('Verify OTP'),
                        ),
                        TextButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () => controller.sendOtp(forceResend: true),
                          child: const Text('Resend OTP'),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
