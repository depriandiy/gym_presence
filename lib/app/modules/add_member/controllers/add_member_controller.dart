import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

class AddMemberController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();
  TextEditingController passAdminC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firesstore = FirebaseFirestore.instance;

  Future<void> proceedAddMember() async {
    if (passAdminC.text.isNotEmpty) {
      try {
        // Get email admin
        String emailAdmin = auth.currentUser!.email!;
        // Login admin
        UserCredential adminCredential = await auth.signInWithEmailAndPassword(
          email: emailAdmin,
          password: passAdminC.text,
        );

        // Admin create member account
        UserCredential memberCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: "memberfos",
        );

        if (memberCredential.user != null) {
          String uid = memberCredential.user!.uid;

          await firesstore.collection("member").doc(uid).set({
            "uid": uid,
            "name": nameC.text,
            "username": usernameC.text,
            "email": emailC.text,
            "age": ageC.text,
            "createdAt": DateTime.now().toIso8601String(),
          });

          await memberCredential.user!.sendEmailVerification();
          // End of create member account.

          await auth.signOut(); // sehingga current user login = null
          // relogin with admin account
          UserCredential adminCredential =
              await auth.signInWithEmailAndPassword(
            email: emailAdmin,
            password: passAdminC.text,
          );

          Get.back();
          Get.offAllNamed(Routes.MEMBERS);
          Get.snackbar("Success", "Add pegawai successfully");
        }

        print(memberCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("Error occured", "The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
              "Error occured", "The email already exists. User others email.");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error occured",
              "Admin password is wrong, can't add member account!");
        } else {
          Get.snackbar("Error occured", e.code);
        }
      } catch (e) {
        Get.snackbar("Error occured", "Add member is failed! Error: $e");
      }
    } else {
      Get.snackbar("Error occured", "Please input the admin password!");
    }
  }

  void addMember(String name, String username, String email, String age) async {
    if (name.isNotEmpty &&
        username.isNotEmpty &&
        email.isNotEmpty &&
        age.isNotEmpty) {
      Get.defaultDialog(
        title: "Admin Validation",
        content: Column(
          children: [
            const Text("Input admin password before add member."),
            TextField(
              controller: passAdminC,
              autocorrect: false,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () => Get.back(),
            child: const Text("CANCEL"),
          ),
          ElevatedButton(
            onPressed: () async {
              await proceedAddMember();
            },
            child: const Text("ADD MEMBER"),
          ),
        ],
      );
    } else {
      Get.snackbar("Error occured", "All data should be filled!");
    }
  }
}
