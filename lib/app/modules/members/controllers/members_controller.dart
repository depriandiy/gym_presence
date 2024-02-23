import 'package:get/get.dart';

class MembersController extends GetxController {
  RxList<Map<String, dynamic>> allMembers = <Map<String, dynamic>>[
    {
      "id": 1,
      "name": "Depri Andiyanto",
      "age": 23,
    },
    {
      "id": 2,
      "name": "Samuel Halim",
      "age": 24,
    },
    {
      "id": 3,
      "name": "Teofilus Tri Haryadi",
      "age": 25,
    },
  ].obs;

  void addMember(String name, String age) {
    if (name.isNotEmpty && age.isNotEmpty) {
      allMembers.add({
        "name": name,
        "age": int.parse(age),
      });
      Get.back();
    }
  }
}
