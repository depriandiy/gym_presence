import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_member_controller.dart';

class AddMemberView extends GetView<AddMemberController> {
  AddMemberView({super.key});
  final addMemberC = Get.find<AddMemberController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Member'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          TextField(
            controller: controller.nameC,
            decoration: const InputDecoration(
              labelText: "Member name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.usernameC,
            decoration: const InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.emailC,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.ageC,
            decoration: const InputDecoration(
              labelText: "Age",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              addMemberC.addMember(
                controller.nameC.text,
                controller.usernameC.text,
                controller.emailC.text,
                controller.ageC.text,
              );
            },
            child: const Text("ADD MEMBER"),
          ),
        ],
      ),
    );
  }
}
