import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  UpdateProfileView({Key? key}) : super(key: key);
  final updateProfileC = Get.find<UpdateProfileController>();
  final uProfile = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.nameC.text = uProfile['name'];
    controller.usernameC.text = uProfile['username'];
    controller.emailC.text = uProfile['email'];
    controller.ageC.text = uProfile['age'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.nameC,
            decoration: const InputDecoration(
              labelText: "Member name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            readOnly: true,
            autocorrect: false,
            controller: controller.usernameC,
            decoration: const InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            readOnly: true,
            autocorrect: false,
            controller: controller.emailC,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            autocorrect: false,
            controller: controller.ageC,
            decoration: const InputDecoration(
              labelText: "Age",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 25),
          const Text(
            "Photo Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<UpdateProfileController>(
                builder: (c) {
                  if (c.imgP != null) {
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.file(
                        File(c.imgP!.path),
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    if (uProfile['profile'] != null) {
                      return SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          uProfile['profile'],
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return const Text("No choosen file.");
                    }
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  controller.pickImage();
                },
                child: const Text("Choose file"),
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              updateProfileC.updateProfile();
              Get.back();
            },
            child: const Text("UPDATE PROFILE"),
          ),
        ],
      ),
    );
  }
}
