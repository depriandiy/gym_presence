import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt dataObs = 0.obs; // reactive state management (Rx) -> using Obx()

  void addData() {
    dataObs++;
  }
}
