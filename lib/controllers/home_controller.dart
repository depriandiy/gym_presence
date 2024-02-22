import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt dataInt = 0.obs;
  RxString dataString = "data".obs;
  RxBool dataBool = true.obs;
  RxList<int> dataList = [1, 2, 3].obs;
  RxMap<String, dynamic> dataMap = <String, dynamic>{
    "id": 1,
    "name": "Depri",
    "age": 22,
  }.obs;

  void changeName() {
    dataMap["name"] = "Rian";
    dataMap["age"] = "23";
  }

  int nextNum = 4;
  void addNumber() {
    dataList.add(nextNum);
    nextNum++;
  }

  void switchBool() {
    // dataBool.value != dataBool.value;
    dataBool.toggle(); // cara simple
  }

  void updateString() => dataString.value = "data (updated)";
  void resetString() => dataString.value = "data";

  void incrementInt() => dataInt++;
  void decrementInt() => dataInt--;
}
