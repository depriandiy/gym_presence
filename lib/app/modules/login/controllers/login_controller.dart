import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        UserCredential loginCredential = await auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );

        if (loginCredential.user != null) {
          if (loginCredential.user!.emailVerified == true) {
            if (passC.text == "memberfos") {
              Get.offAllNamed(Routes.NEW_PASSWORD);
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          } else {
            Get.defaultDialog(
              title: "Account Verification",
              middleText:
                  "Can't login with this email, check your verification email to verify your account.",
              actions: [
                OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await loginCredential.user!.sendEmailVerification();
                      Get.back();
                      Get.snackbar("Success",
                          "We've already send verification to your email. Check the message.");
                    } catch (e) {
                      Get.snackbar("Error occured",
                          "Can't send verification email. Call to admin.");
                    }
                  },
                  child: const Text("Send Again"),
                ),
              ],
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print("User not found");
          Get.snackbar("Error occured", "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              "Error occured", "Wrong password provided for that email.");
        } else if (e.code == 'invalid-email') {
          Get.snackbar(
              "Error occurred", "Please provide a valid email address.");
        }
      } catch (e) {
        Get.snackbar("Error occured", "Login failed. Try again.");
      }
    } else {
      Get.snackbar("Error occured", "Email and password should be filled!");
    }
  }
}
