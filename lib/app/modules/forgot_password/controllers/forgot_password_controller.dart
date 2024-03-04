import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void sendEmail() async {
    if (emailC.text.isNotEmpty) {
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);
        Get.snackbar("Success",
            "We've already sent email. Check your email to reset password.");
        Get.back();
      } catch (e) {
        Get.snackbar("Error occured", "Reset password is failed!");
      }
    }
  }
}
