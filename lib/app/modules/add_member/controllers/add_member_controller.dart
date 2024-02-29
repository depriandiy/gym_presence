import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddMemberController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firesstore = FirebaseFirestore.instance;

  void addMember(String name, String username, String email, String age) async {
    if (name.isNotEmpty &&
        username.isNotEmpty &&
        email.isNotEmpty &&
        age.isNotEmpty) {
      try {
        UserCredential memberCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: "memberfos",
        );

        if (memberCredential.user != null) {
          String uid = memberCredential.user!.uid;

          await firesstore.collection("member").doc(uid).set({
            "uid": uid,
            "name": nameC.text,
            "username": usernameC.text,
            "email": emailC.text,
            "age": ageC.text,
            "createdAt": DateTime.now().toIso8601String(),
          });
        }

        print(memberCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("Error occured", "The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
              "Error occured", "The email already exists. User others email.");
        }
      } catch (e) {
        Get.snackbar("Error occured", "Add member is failed! Error: $e");
      }
    } else {
      Get.snackbar("Error occured", "All data should be filled!");
    }
    Get.back();
  }
}
