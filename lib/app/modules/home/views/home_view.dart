import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FOS Gym'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.userRole(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String role = snapshot.data!.data()!['role'];
            if (role == "admin") {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.MEMBERS),
                      child: const Text("SEE MEMBERS"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.PROFILE),
                      child: const Text("PROFILE"),
                    ),
                  ],
                ),
              );
            } else {
              return ElevatedButton(
                onPressed: () => Get.toNamed(Routes.PROFILE),
                child: const Text("PROFILE"),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Get.offAllNamed(Routes.LOGIN);
        },
        child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}
