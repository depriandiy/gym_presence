import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_presence/app/modules/members/controllers/members_controller.dart';

import '../controllers/add_member_controller.dart';

class AddMemberView extends GetView<AddMemberController> {
  AddMemberView({super.key});
  final memberC = Get.find<MembersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddMemberView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Member name",
            ),
          ),
          TextField(
            controller: controller.ageC,
            decoration: InputDecoration(
              labelText: "Age",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              memberC.addMember(controller.nameC.text, controller.ageC.text);
            },
            child: Text("ADD MEMBER"),
          ),
        ],
      ),
    );
  }
}
