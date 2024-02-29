import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  void login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        UserCredential loginCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Error occured", "No user found for that username.");
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            "Error occured",
            "Wrong password provided for that username.",
          );
        }
      } catch (e) {
        Get.snackbar("Error occured", "Login failed. Try again.");
      }
    } else {
      Get.snackbar(
        "Error occured",
        "Email and password should be filled!",
      );
    }
  }
}
