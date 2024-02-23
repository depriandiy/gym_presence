import 'package:get/get.dart';
import 'package:gym_presence/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    // Get.put(() => HomeController()); // bisa diatur banyak binding
  }
}
