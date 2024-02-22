import 'package:get/get.dart';

class HomeController extends GetxController {
  // RxInt dataObs = 0.obs; // reactive state management (Rx) -> using Obx()
  int dataObs = 0; // simple state management -> using GetBuilder()

  void addData() {
    dataObs++;
    if (dataObs % 5 == 0) {
      update();
    }
  }

  void refreshData() {
    update();
  }
}
