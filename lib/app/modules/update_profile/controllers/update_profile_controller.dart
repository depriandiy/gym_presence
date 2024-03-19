import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  FirebaseFirestore fStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  //
  final ImagePicker picker = ImagePicker();
  XFile? imgP;

  void pickImage() async {
    imgP = await picker.pickImage(source: ImageSource.gallery);
    if (imgP != null) {
      print(imgP!.name);
      print(imgP!.path);
    } else {
      print(imgP);
    }
    update();
  }

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
