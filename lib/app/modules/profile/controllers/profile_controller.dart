import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gym_presence/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> userProfile() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("member").doc(uid).snapshots();
  }

  void signOut() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
