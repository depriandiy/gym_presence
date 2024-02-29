import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

class NewPasswordController extends GetxController {
  TextEditingController newPassC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void newPassword() async {
    if (newPassC.text.isNotEmpty) {
      if (newPassC.text != "memberfos") {
        try {
          String? email = auth.currentUser!.email; // Save email first.
          await auth.currentUser!.updatePassword(newPassC.text);
          // Auto logout.
          await auth.signOut();

          // Auto login
          await auth.signInWithEmailAndPassword(
            email: email!,
            password: newPassC.text,
          );
          Get.offAllNamed(Routes.HOME);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar(
                "Error occured", "Password must be at least 6 character.");
          }
        } catch (e) {
          Get.snackbar("Error occured",
              "Update password failed! Try again or call to admin.");
        }
      } else {
        Get.snackbar("Error occured",
            "Password must be different from 'memberfos'. Use other options.");
      }
    } else {
      Get.snackbar("Error occured", "Please input your new password.");
    }
  }
}
