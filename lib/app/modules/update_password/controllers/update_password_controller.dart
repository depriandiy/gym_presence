import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController currPassC = TextEditingController();
  TextEditingController newPassC = TextEditingController();
  TextEditingController confirmNewPassC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePass() async {
    if (currPassC.text.isNotEmpty &&
        newPassC.text.isNotEmpty &&
        confirmNewPassC.text.isNotEmpty) {
      if (newPassC.text == confirmNewPassC.text) {
        try {
          String currEmail = auth.currentUser!.email!;
          // Relogin
          await auth.signInWithEmailAndPassword(
              email: currEmail, password: currPassC.text);
          // Update with new password
          await auth.currentUser!.updatePassword(newPassC.text);

          Get.back();
          Get.snackbar("Success", "Update password successfully.");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'wrong-password') {
            Get.snackbar("Error occured", "Wrong password, please try again.");
          } else {
            Get.snackbar("Error occured", e.code.toLowerCase());
          }
        } catch (e) {
          Get.snackbar("Error occured", "Can't proceed the update password!");
        }
      } else {
        Get.snackbar(
            "Error occured", "Confirm password must be same as new password.");
      }
    } else {
      Get.snackbar("Error occured", "All column must be filled.");
    }
  }
}
