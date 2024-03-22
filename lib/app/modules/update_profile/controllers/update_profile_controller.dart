import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;

class UpdateProfileController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  FirebaseFirestore fStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance; //sampe sini
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
        Map<String, dynamic> data = {
          "name": nameC.text,
          "age": ageC.text,
        };
        if (imgP != null) {
          File pFile = File(imgP!.path);
          String ext = imgP!.name.split('.').last;

          await storage.ref('$uid/profile.$ext').putFile(pFile);
          String uImg = await storage.ref('$uid/profile.$ext').getDownloadURL();

          data.addAll({
            "profile": uImg,
          });
        }
        await fStore.collection("member").doc(uid).update(data);
        Get.snackbar("Success", "Update profile successfully!");
      } catch (e) {
        Get.snackbar("Error occured!", "Can't update the data profile.");
      }
    }
  }
}
