import 'package:get/get.dart';

class MembersController extends GetxController {
  RxList<Map<String, dynamic>> allMembers = <Map<String, dynamic>>[
    {
      "id": 1,
      "name": "Depri Andiyanto",
      "username": "depriandiy",
      "age": 23,
    },
    {
      "id": 2,
      "name": "Samuel Halim",
      "username": "samuelh",
      "age": 24,
    },
    {
      "id": 3,
      "name": "Teofilus Tri Haryadi",
      "username": "teofilusth",
      "age": 25,
    },
  ].obs;
}
