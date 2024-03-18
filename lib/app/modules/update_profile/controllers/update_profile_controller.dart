import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  FirebaseFirestore fStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateProfile() async {
    String uid = auth.currentUser!.uid;
    if (nameC.text.isNotEmpty && ageC.text.isNotEmpty) {
      try {
        await fStore.collection("member").doc(uid).update({
          "name": nameC.text,
          "age": ageC.text,
        });
        Get.snackbar("Success", "Update profile successfully!");
      } catch (e) {
        Get.snackbar("Error occured!", "Can't update the data profile.");
      }
    }
  }
}
