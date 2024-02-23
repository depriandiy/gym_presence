import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

import '../controllers/members_controller.dart';

class MembersView extends GetView<MembersController> {
  const MembersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MembersView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: controller.allMembers.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              controller.allMembers[index]["name"],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_MEMBER);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
