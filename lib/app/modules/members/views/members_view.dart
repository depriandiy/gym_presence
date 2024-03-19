import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_presence/app/modules/members/views/member_item_view.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

import '../controllers/members_controller.dart';

class MembersView extends GetView<MembersController> {
  const MembersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FOS Member'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamAllMembers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<DocumentSnapshot<Map<String, dynamic>>> members =
                snapshot.data!.docs;
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: members.length,
              itemBuilder: (context, index) {
                Map<String, dynamic>? memberData = members[index].data();
                return MemberItem(memberData!);
              },
            );
          } else {
            return const Center(
              child: Text("No data"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_MEMBER);
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
