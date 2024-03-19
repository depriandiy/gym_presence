import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  const UpdatePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Password'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          TextField(
            autocorrect: false,
            obscureText: true,
            controller: controller.currPassC,
            decoration: const InputDecoration(
              labelText: "Current Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            obscureText: true,
            controller: controller.newPassC,
            decoration: const InputDecoration(
              labelText: "New Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            obscureText: true,
            controller: controller.confirmNewPassC,
            decoration: const InputDecoration(
              labelText: "Confirm New Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.updatePass();
            },
            child: const Text("UPDATE PASSWORD"),
          ),
        ],
      ),
    );
  }
}
