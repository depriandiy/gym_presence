import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MembersController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Get current login member data, DocumentSnapshot<>
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamMember() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("member").doc(uid).snapshots();
  }

  // Get all members data, QuerySnapshot<>
  Stream<QuerySnapshot<Map<String, dynamic>>> streamAllMembers() {
    return firestore.collection("member").snapshots();
  }
}
